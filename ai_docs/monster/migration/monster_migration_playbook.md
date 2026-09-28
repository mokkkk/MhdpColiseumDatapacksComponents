# モンスター新形式移行 実行手順プレイブック（ドラフト）

> **本ドキュメントの位置づけ**: `mhdp_monster_valk`（天彗龍）の旧形式→新形式移行（2026-09〜2026-09-23、全85グループ完了）で得られた知見を一般化した**実行手順書**。
> `monster_datapack_spec.md`（新形式の仕様定義）・`monster_datapack_comparison.md`（新旧の差分対照表）とは役割が異なり、こちらは「実際にどう進めるか」「どの順番で・どう判断するか」にフォーカスする。
> **ドラフト版**: valk 1体分の移行経験のみから抽出したため、valk 固有の癖（例: 部位破壊パターン、object 命名規則）を一般則と誤認している可能性がある。次のモンスター移行に適用した際に齟齬が出た箇所は随時修正すること。

## 参照
- 仕様: `ai_docs/monster_datapack_spec.md`
- 新旧差分: `ai_docs/monster/migration/monster_datapack_comparison.md`
- 実例トラッカー（詳細ログ）: `ai_docs/monster/valk/migration_progress.md`
- 新形式テンプレ実装: `mhdp_monster_dino`（最も充実、参照優先度高）, `mhdp_monster_ranposu`（同一変換の先行実例）
- 共通エンジン: `mhdp_core/data/mhdp_monsters/`, `mhdp_core/data/assets/`

---

## 0. 事前準備・前提

- 旧形式データは `mhdp_monster_<name>_bak`（未move、そのまま残置）。新形式を `mhdp_monster_<name>` に新規構築する。
- AJ（Animated Java）再エクスポートは**ユーザーが実施**。`animated_java_<name>/` の Read/Grep は禁止（巨大・コンテキスト圧迫）。frame 番号やボーン/ロケータ名が必要な場合は `mhdp_monster_<name>_bak` の event ファイルを参照し、それでも不明ならユーザーに質問する。
- `mhdp_core` 側の Uid 配線は既存前提（変更不要なことが多いが、新規モンスターでは要確認）。
- git commit は**ユーザーが手動**。Claude は「commit すべきタイミング」を通知するのみで、勝手に commit しない。
- 移行はバッチ単位で進め、**バッチ終了ごとに進捗トラッカー（`ai_docs/monster/<name>/migration_progress.md`）を更新する**。このトラッカーは移行完了後にこのプレイブックへ知見を還流する一次ソースになるので、生成物だけでなく「判断理由」「ユーザー指摘」を都度書き残すこと。
- `migration_progress.md` は移行が進むほど肥大化し、**1ファイルとしては Read の一括読み込みが不可能なサイズ**になり得る（valk では25,500トークン超で一括Readが失敗）。`offset`/`limit` を指定した分割読みか `Grep` を前提に運用する。

---

## 1. Stage 構成（推奨進行順）

dino/ranposu の構造に倣い、以下の順で進める。各 Stage は前 Stage の完了を前提にする。

### Stage 1 — メタ/register/load/_index.d
`pack.mcmeta`、`load.mcfunction`、`_index.d.mcfunction`、`core/register.mcfunction`（objectives + MonsterData + DefenceData + AttackData 新スキーマ）。
- AttackData は攻撃技名ごとに1エントリ。左右分岐がある技（翼・腕など）は `<Name>.Left`/`<Name>.Right` を必ず用意する（Stage 5 で参照名がずれるバグの温床になる。§5 参照）。
- NameId/ShowName の resource pack キー追加もここで洗い出す。

### Stage 2 — summon/init/remove/death
`core/summon/summon.mcfunction`、`core/init/.mcfunction`（部位耐久・固有スコア初期化・初期アニメ）、`core/remove/remove.mcfunction`、`core/death/death.mcfunction`。
- 弾/VFX の後始末（`kill`）は Stage 6-S（object 移行）が終わるまで確定させられないため、暫定 `#TODO` で留めてよい。

### Stage 3 — tick骨格 + フェーズ
`core/tick/{tick,main}.mcfunction`、`effect_anger*`、`on_relax/`, `on_caution/`, `on_battle/`（`check_target`/`update_target`/`update_hate`/部位別 `attack/*`）。
- 旧コードの `on passengers ... data.locators.*` 記法は必ず `at_locator`/`as_locator` に変換する（CLAUDE.md 参照）。

### Stage 4 — damage / reaction / break
`core/damage/damage.mcfunction`、`reaction/{anger,anger_end,counter,stun,paralysis,ambush,general,flying,<part>}.mcfunction`、`break/{<part>}.mcfunction`（dino 準拠でフォルダ化）。
- 各 `reaction/*` の冒頭に `mhdp_monsters:core/util/damage/on_reaction_start` を追加する。
- 部位破壊は `break/` フォルダに集約し、`reaction/<part>` が閾値到達時に `break/<part>` を呼ぶ構成にする。
- 旧コードに dino/他モンスターからの丸コピペ（存在しないアニメ名参照、無関係な固有タグ参照）が紛れていないか精読する（§5「よくあるバグパターン」参照）。

### Stage 5 — animation change / event（メイン作業・バッチ処理）
最も工数がかかる Stage。3段階に分割する。

#### 5-A: `change/*`（行動選択ロジック）
`change/main.mcfunction`（Phase分岐）、`on_relax/on_caution/on_battle` 系、抽選ロジック（`check_player_situation.m` → 基礎重み → 状態別 merge → `decide_animation.m` → `remove_tag` → action_id分岐 → `turn` → reset）、`change/play/*`（AJ名前空間置換）。
- dino/ranposu の抽選テンプレに**既知の誤記**（例: `check_player_situation.m` のタグ引数が実際のタグ名と食い違っている等）が存在することがある。旧コードの正しい重み付けロジックが生きている場合は、テンプレを厳密コピーせず正しい方を採用してよい（ただしユーザーに一言確認するか、明確な誤記の証拠がある場合のみ）。
- `change/interrupt.mcfunction` は Stage 6 の `core/debug/interrupt` 相当に回す。

#### 5-B: `event/main.mcfunction`（ディスパッチャ）
グループごとの `.playing` タグ判定行を、グループ作成に合わせて随時追記していく（5-C と並行進行）。

#### 5-C: `event/<group>/*`（アニメーショングループ本体）
モンスターの技・状態ごとに1グループ = 1フォルダ。詳細な進め方は §2「グループ移行の進め方」、確立済み実装パターンは §3「API/パターンカタログ」を参照。

### Stage 6 — util / models / phase / debug / advancement
- `core/util/models/*`: 旧 `on passengers ... item.id="minecraft:white_dye" + custom_model_data:N` は `execute [if ...] run function animated_java_<name>:<name>/as_node {name:'<bone>',command:'data modify entity @s item.components."minecraft:item_model" set value "<ID>"'}` に変換。**モデルIDは仮プレースホルダで良く、AJ再エクスポート後に差し替える前提で先に進めてよい**（`# TODO` を明記）。
- `core/util/phase/*` は「熱化/風化ギミックなど dino 固有の仕組みの丸コピペ」であることが多く、対象モンスターにその仕組みが無ければ**生成しない**のが基本判断。ただし、モンスター固有の「状態に応じて部位の肉質/PartIdを一時的に切り替える」系のロジック（例: valk の龍気吸引中の胸肉質化）がある場合は、例外的に `phase/` を新設してよい。
- `core/debug/interrupt.mcfunction`/`interrupt_anger.mcfunction`: 実装要否をユーザーに確認する（valk では「実装不要」と明示的に指示された）。
- `advancement/toast_break.json`: 他モンスター（dino/ranposu）の同名ファイルをテンプレとしてそのまま複製し、`item_model`/`title` のみ差し替える。

#### Stage 6-S — 弾/VFX の `assets:object/` 移行
旧 `core/tick/shot/*` を `mhdp_core/data/assets/function/object/<ObjectId>.<name>_*` へ移植する。詳細は §4「object（弾/VFXシステム）カタログ」参照。

---

## 2. グループ移行の進め方

### 2.1 単純グループ vs 複雑グループの判定
以下のいずれかに該当する場合は「複雑グループ」として §2.2 の4段階運用に切り替える。該当しなければ単一パス生成で構わない（往復コストが増えるため過剰適用しない）。

- 複数種類の object（VFX/弾）を扱う
- 特殊な当たり判定パターン（複数回ヒット、複数箇所同時判定、独自の判定形状）を要する
- 旧コードの構造が複雑で読解に複数ステップを要する（例: phase分割された連続技）

判定は事前に確定させる必要はなく、**着手後に複雑と判明した時点で切り替えてよい**。

### 2.2 複雑グループの4段階運用
標準順序:
1. **実装計画の提示**（旧コードの構造分析、疑問点の洗い出し、ユーザーへの計画提示）
2. **main/end/移動/演出（object除く）の作成**（アニメーション動作確認可能な状態にする）
3. **演出（object使用）の作成**（対応する object の `init/` 実装も同時に行う）
4. **攻撃判定の作成**

各段階の終わりにユーザーレビューを挟む。

**バリアント**: グループの構造次第で順序を入れ替えてよい（valk の `comet_phase_*` では「①移動+非object演出 → ②攻撃判定 → ③object演出」の順にユーザーが指示。理由は object 側（10041-10044）の `init/` が Stage 6-S 時点で未実装のまま残っており、判定ロジックを先に固めたかったため）。**VFXと攻撃判定が同一フレーム・同一ファイルで発火する構造**（例: 爆発演出と同時にダメージが出る技）の場合、Phase3とPhase4を1ファイルに統合してよい（`shoot_bomb_*`/`shoot_sault` の `attack.mcfunction` が実例）。

### 2.3 バッチの粒度
「対応する旧グループの構造が同型」であるグループ群（例: idle/move/turn系、lance_damage系）はまとめて1バッチで処理してよい。複雑グループは基本1グループ単位、多くても2-3グループでバッチを切る。

### 2.4 各グループ共通の変換ルール
- 接地処理: `mhdp_monsters:core/util/tick/move/check_landing` の1行に統一（旧の2行パターン `on_ground`/`tp` は使わない）。
- `.playing` タグ: `aj.<old_ns>.animation.X.playing` → `animated_java_<name>.<name>.animation.X.playing`。
- AJ 名前空間: `animated_java:<old>_aj/` → `animated_java_<name>:<name>/`。
- 攻撃実行は旧 `mhdp_core:player/damage/entity_to_*` を全廃し `apply_attack.m`/`apply_attack_distance.m`/`start_attack.m`/`end_attack` 系（§3.1）に統一。
- ロケータ参照は `at_locator`/`as_locator`（CLAUDE.md 記法）。
- 軸合わせは `alignment_start.m`/`alignment`（§3.2）に統一。個別 `turn_start*.mcfunction` ファイルは廃止。
- **旧ファイルの精読は必須**。「ヘッダーコメントが別グループのコピペ」「main から未参照の dead code」「他モンスター（特に dino）のコピペで無関係なタグ/Uidを参照」は非常に高頻度で見つかる（§5参照）。移植前に必ず「このファイルは実際に main から呼ばれているか」を確認する。

---

## 3. API / パターンカタログ（確立済み）

### 3.1 攻撃判定
- **`apply_attack.m`**: 直方体（cuboid）の単発当たり判定。Player/Entity/建造物を1回の呼び出しでまとめて処理する。`Offset_X/Y/Z`, `Scale_X/Y/Z`, `AttackName` を指定。旧の球状距離判定（`distance=..N`）は近似的に直方体へ変換する（**要実機調整**、Scale は概ね旧の直径〜半径をベースに近似値を置く）。
- **`apply_attack_distance.m`**: 距離（球状）判定バリアント。object の自己ダメージ（例: 射撃弾の着弾）や、1tickに複数回判定したいケースに使う。
- **`start_attack.m` / `end_attack`**: 相殺判定の有効化ウィンドウを開始・終了する。**攻撃判定を持つグループは基本的に必須**（抜けているとレビューで指摘される、valk の shoot_sweep 系で実例）。ただし「相殺不可の技」（旧コードに該当窓が無い、連続ヒットのお手・突進中判定など）は意図的に挟まない。
- **複数回ヒットする技**: 判定区間ごとに個別の `start_attack.m`/`end_attack` ペアで挟む（1回目のヒット窓を閉じてから2回目を開く。旧コードの「毎frame判定し続ける」実装をそのまま連続化しない）。
- **デバッグ表示**: 各 `hit_*`/`attack*.mcfunction` の `apply_attack.m` 呼び出し直前に、**同一引数**で `api:bounding/cuboid_preview.m` を配置する。**生成時点ではコメントアウトしない**（[[cuboid-preview-debug-uncommented]]。実機確認後にユーザー側でコメントアウトする運用）。
- **AttackName**: register.mcfunction のエントリ名と完全一致させる。左右分岐技（`.Left`/`.Right`）は特に付け忘れやすい（§5）。

### 3.2 軸合わせ（ターゲット方向への回転）
```
# 開始（frame単発、at @s 不要）
execute if score @s aj.<anim>.frame matches <startFrame> run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.<Upper>",Tick:<YY>,MaxRotation:<ZZZ>}

# 実行（frame範囲、at @s 必須）
execute if score @s aj.<anim>.frame matches <range> at @s run function mhdp_monsters:core/util/tick/event/alignment
```
- `<YY>`（Tick）は旧 `turn_start` 系の `#mhdp_temp_rotate_tick` 設定値を流用。
- `<ZZZ>`（MaxRotation）は旧コードに明示的な角度上限が無ければ **360** を採用する（180ではない。valk の lance_bite/lance_tackle でユーザーが訂正した判断を踏襲）。
- **要注意**: `alignment_start.m` は内部で自分専用スクラッチマーカーに `Temp.Rotate.Target.Marker` という固定タグ名を使う。呼び出し側が既存の外部ターゲットタグとして偶然同じ名前を使っていると、内部マーカー（距離0で必ず最近傍）を誤って拾ってしまう。呼び出し前に一旦ユニークな中間タグへ付け替えてから呼ぶこと（[[alignment-start-pattern]]）。
- 精密軸合わせ（毎tick追従、frame範囲全体）が必要な場合は `mhdp_monsters:core/util/tick/event/turn_to_target_accurate`（`at @s` 付き）を使う（突進の助走・移動先マーカーへの追従など）。

### 3.3 移動
2系統あり、**用途で使い分ける**（[[movement-api-vector-vs-movepos]]）:

- **`vector_move_offset_start.m`（自己相対オフセット）/ `vector_move_start.m`（外部ターゲット指定）+ `vector_move`**: 決められたtickで目的地まで正確に移動する。定位置移動、死亡/飛行怯みの落下、固定距離のダッシュなど。`IsAdjustLand:"true"` で着地補正。旧の非推奨 `move_to_target_calc`/`move_to_target_move` は見つけ次第これに置換する。
- **`MovePos` マーカー方式**（`move_to_target_calc`/`move_to_target_move` + `Mns.MovePos.<Name>` の `area_effect_cloud` マーカー）: 不定のtickで目的地までおおざっぱに移動する。プレイヤー位置に応じてアニメ長が変わる突進系攻撃など。**旧のまま維持してよい**（非推奨ではあるが、この用途に対応する新APIが無い限り置換不要）。
- 判断基準: 「固定tick・正確な移動量」か「可変長・プレイヤー追従」かで選ぶ。

### 3.4 地面のひび割れ演出
```
execute positioned <offset> rotated ~ 0 run function api:object/summon.m {ObjectId:16}
```
`ObjectId:16`（`0016.ground_crack`、汎用共有オブジェクト）。接地スナップはオブジェクト側が行うため、呼び出し側でマーカー方向指定は不要。

### 3.5 モデル演出（発光/点火/破壊表示）
`core/util/models/*` に切り出す（`ignite_start/end[_left/_right]`, `anger_start/end`, `break_<part>`, `chest_glow_start/end` 等、dino/ranposu 準拠）。`as_node` 経由で `item.components."minecraft:item_model"` を書き換える。モデルIDはAJ再エクスポート前は仮プレースホルダで先に進めてよい。

---

## 4. object（弾/VFXシステム）カタログ

弾・VFXは `mhdp_core/data/assets/function/object/<ObjectId>.<name>_<label>/` に集約し、モンスター側は `api:object/summon.m {ObjectId:N}` を呼ぶだけにする（tick ループをモンスター側に持たせない）。

### 4.1 構成（1 object あたり）
- `_index.d.mcfunction`（`#declare tag <ObjectId>.<State>`）
- `summon/.mcfunction`（エンティティ生成。`Asset.Object.<Name>` のようなモンスター共通タグを付与）
- `init/.mcfunction`（`tp @s ~ ~ ~ ~ ~` 等の初期化 + `Arg.Override` の受け取り）
- `tick/.mcfunction` + サブファイル（frame送り、`move`/`hit`/`attack` 等）
- `remove/.mcfunction`（`kill @s` が基本。将来複数エンティティ構成になった場合の一括処分口として分離しておく）
- `alias/<ObjectId>/{init,summon,tick}.mcfunction`（3リダイレクト）
- `summon/debug.mcfunction`（`Arg.Override` を設定して自身を手動召喚するデバッグ関数。実行者の位置・向きに召喚）

### 4.2 `Arg.Override` の仕組み
呼び出し側で `data modify storage api: Arg.Override.<Key> set value <V>` を積んでから `api:object/summon.m {ObjectId:N}` を呼ぶ。`summon.m` が summon→init を実行し、最後に `Arg.Override` を自動クリアする。object の `init/.mcfunction` 側は:
```
execute store result score @s <Score> run data get storage api: Arg.Override.<Key>
execute if data storage api: Arg.Override{<Key>:<V>} run tag @s add <Tag>
```
で受け取る。

**よくある Override 引数パターン**:
- `Scale`（数値）: `init/apply_scale.m.mcfunction` に切り出し、`transformation.scale` を上書き。**平面表示（text_display のフラットVFX）は X/Y のみ変更しZ=1固定**、立体表示は均等スケール。
- `IsLong`（bool）: ループ生存フラグ。true で専用タグ（例 `<ObjectId>.Long`）を付与し、tick側で自動消滅させずループ継続。
- `IsFollow`（bool）: 呼び出し側が追従・killの対象を一意に特定するための識別タグを付与するだけ（object自体は何もしない）。
- `Tag`（文字列）: 複数体を同時展開する場合の個体識別用（例: 6箇所同時のロケータ追従）。`<ObjectId>.<Tag>` タグを付与し、呼び出し側はそのタグで直接対象を指定できる（旧の「未処理の1体を毎回選ぶ」ラウンドロビン式より単純で確実）。

### 4.3 ダメージ方針
**object は原則 VFX のみ**。ダメージ判定は本体アニメーションイベント側（`apply_attack.m` 等）で行う。object内で自ダメージするのは「独立して飛び、着弾点が事前に読めない」もの（例: 射撃弾）のみで、`apply_attack_distance.m` を tick 内で使う。

### 4.4 ループ型VFXの生存管理
frame 0-1-2 をループさせるタイプ（ビーム/ジェット/雷等）は、**呼び出し側が明示的に `kill` するのが主たる終了手段**。tick内の `ObjectTick matches 300..` のような自動kill上限は、呼び出し側のkill漏れに対する**安全策**として残すのみで、主ロジックにしない（コメントで明記しておくこと。旧TODOをここで確定情報に置き換える）。

### 4.5 旧コード精読時の注意
旧 `core/tick/shot/vfx_*/damage.mcfunction` のような「ダメージ処理っぽいファイル」でも、実際は**他モンスター（特にdino）のコピペで、参照している Uid/タグが無関係**なことがある。中身を精読し、実際に呼ばれているか・値が自モンスターと整合しているかを確認してから移植要否を判断する。

---

## 5. よくあるバグパターン（旧コード精読チェックリスト）

移行時、旧コードから以下のパターンが高頻度で見つかる。グループ移行のたびに意識的にチェックする。

1. **ヘッダーコメントが無関係な別グループのコピペ**（ファイル冒頭の `#>` コメントが実際のファイルパスと食い違う）。ほぼ全旧形式ファイルに存在すると想定してよい。
2. **他モンスター（特にdino）のコピペ残留**: 存在しないアニメ名参照、無関係なUid/固有タグ参照（例: `Mns.Target.Dino` が自モンスターのコードに残る）。
3. **AttackName の laterality 抜け**: register.mcfunction 側は `.Left`/`.Right` で分割されているのに、旧コード側の参照が無印のまま（例: `Sweep` のつもりが register は `Sweep.Left`/`Sweep.Right`）。
4. **左右の取り違え**: ロケータ名（`pos_wing_l_*`/`pos_wing_r_*`）や `positioned` のオフセット符号が、実際のアニメーションの左右と逆になっている。AJ側の実際の動きで確認が必要なため、疑わしい箇所はユーザーに確認する。
5. **非推奨API（`move_to_target_calc`/`move_to_target_move`）の残留**: dino側の最新実装（`vector_move_offset_start.m`/`vector_move_start.m`）に置換できないか確認する（§3.3）。ただし MovePos 用途は置換不要（§3.3参照）。
6. **`end.mcfunction` の無関係な `kill` 行**: 別グループからのコピペで、自グループに存在しないタグ/エンティティを kill しようとしている。
7. **dead code**: main.mcfunction から一切参照されていないファイル（`turn_start.mcfunction` の残骸、別グループ用ヘッダを持つ孤立ファイルなど）。移植不要だが、**「到達不能に見える」というだけの理由でコメントアウト提案をしない**（[[prefer-active-fallback-over-dead-code-guess]]）。フォールバックとして活きている可能性がある場合は有効なまま残す。
8. **共有オブジェクト内の古いTODOコメント**: 呼び出し元の実装が後から進んだことで既に解決済みのTODOが object 側に残ったままになることがある（Stage 6-S を先行実施し、Stage 5-C で呼び出し元を後追い実装する進行順の場合に発生しやすい）。全グループ移行完了後に一度、object 側のTODOを一括棚卸しする工程を設けるとよい（§6参照）。

---

## 6. 完了時のチェックリスト

全グループ移行後、以下を確認してから完了とする:

- [ ] Stage 5-C の全グループが approve 済み
- [ ] `event/main.mcfunction`（ディスパッチャ）に全グループが配線済み
- [ ] Stage 6 必須項目（`advancement/toast_break.json` 等）完了。`interrupt` 系はユーザーに要否確認
- [ ] **弾/VFXシステムの最終棚卸し**: 全 object の `_index.d`/`summon/`/`init/`/`tick/`/`remove/`/`alias/` を通し確認し、古いTODOコメントが実装漏れなのか既に解決済みなのかを判定して整理する
- [ ] `grep -rnP '\S  +\S' <対象ディレクトリ>`（コメント行除外）でトークン間スペースの2連続を検出・修正（CLAUDE.md ルール）
- [ ] `animated_java_<name>/` を読まずに済んだか（読んでいたら要修正）

---

## 7. 次モンスター移行時にこのドラフトを見直す観点

- 本ドキュメントの大半は valk（飛行・翼技主体・射撃/彗星の2形態切り替え）1体分の経験に基づく。地上専投・単一形態・水棲などモンスター特性が大きく異なる場合、§3（特に移動・軸合わせ）や§4（object構成）に固有の前提が紛れていないか確認する。
- AttackName・部位構成・object命名（`<ObjectId>.<name>_<label>`）は Uid ごとに割り当てが変わる。数字は流用せず必ず新規モンスターのUidに基づき採番する。
- 「複雑グループの4段階運用」の判定基準（§2.1）は今のところ定性的。件数がある程度貯まったら定量的な目安（object数・判定パターン数など）に落とし込めるか検討する。
