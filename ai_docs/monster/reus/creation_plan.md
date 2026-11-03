# `mhdp_monster_reus` 新規作成計画（共通テンプレート抽出 + reus 生成）

> **このドキュメントの使い方**
> - 本計画は「① 全モンスター共通処理のテンプレート化」→「② テンプレートから `mhdp_monster_reus` を生成」→「③ reus 固有部分の実装」の 3 段で進める。
> - ユーザーの判断・情報が必要な箇所は **`Q-xx`** として列挙している。各 Q の下の **`A:`** 行に回答を書き込むこと。
>   回答が空の Q に依存する作業は着手しない（Claude は想像で埋めない）。
> - `mhdp_monster_reus_bak` は**異なる AJ ファイルを使っていたため参照しない**（ユーザー指示）。値・構造の根拠は本計画の回答 / 仕様書 / dino・ranposu・valk の実装のみとする。
> - 関連資料: [`ai_docs/monster_datapack_spec.md`](../../monster_datapack_spec.md)（共通ファイル仕様）、[`new_monster_creation_guide.md`](../create_new/new_monster_creation_guide.md)（新規作成の進め方）、[`monster_spec_template.md`](../create_new/monster_spec_template.md)（内容仕様書テンプレート）、[`monster_migration_playbook.md`](../migration/monster_migration_playbook.md)（API カタログ・バグパターン）。
> - git commit はユーザーが手動で行う。Claude は区切りごとに「commit 推奨タイミング」を通知するのみ。

---

## 1. 共通処理の分析結果（dino / ranposu / valk）

3 体の `data/mhdp_monster_<name>/` を比較した（`event/<anim>/*` と `change/on_battle/*` の個別ファイルは除外）。
**3 体すべてに存在するファイルは 53 個**。名前（`<name>` / `<Upper>` / `<uid>`）を正規化したうえで差分行数を測り、以下の 3 区分に分けた。

> テンプレートの**ベース実装は valk** とする。valk は最新の移行作業で整備されており、`@within` コメントの正確さ・`intrusion` の完成度・弾/VFX（`Asset.Object.<Upper>`）の掃除処理など、dino / ranposu の残課題が解消されているため。

### 1.1 区分 A — 名前置換だけで流用できる（差分はコメントのみ or 0）

| ファイル（`function/` 以下） | 置換以外の注意点 |
| --- | --- |
| `load` | なし |
| `core/tick/tick` | valk の弾処理 TODO コメントは除去 |
| `core/tick/main` | 怒り演出の呼び出し行のみ（`effect_anger` の中身は区分 B） |
| `core/summon/summon` | valk 版を採用（`@within` / コメント正確） |
| `core/summon/intrusion` | **valk 版を採用**（dino/ranposu 版は存在しない `summon_init` を参照する壊れたコピペ） |
| `core/remove/remove` | valk 版を採用（`Asset.Object.<Upper>` の掃除、HitBox 削除が有効）。固有スコアのリセット行は reus に合わせる |
| `core/death/death` | 討伐アニメ名（`death`）のみ。valk 版の `Asset.Object.<Upper>` 掃除を含める |
| `core/tick/on_relax/tick`, `on_caution/tick`, `on_caution/start` | なし |
| `core/tick/on_battle/tick` | 建築物サーチ（`on_search_object`）の有無で 4 行差（→ Q-16） |
| `core/tick/on_battle/start`, `check_target`, `update_hate`, `update_target` | `start` の "!" 表示先 HitBox タグ（`Mns.HitBox.<Upper>.Head`） |
| `core/tick/on_battle/attack/head`, `body`, `tail`, `end` | 部位構成に合わせて増減（→ Q-07） |
| `core/tick/animation/change/on_caution/main` | なし |
| `core/tick/animation/change/play/relax_walk` | なし |
| `core/util/fetch_player`, `show_bossbar`, `show_toast`, `hide_toast` | なし |
| `core/debug/interrupt_anger` | なし |
| `advancement/toast_break.json` | `icon` の `item_model`（`icons/<name>`）（→ Q-05） |

### 1.2 区分 B — 構造は共通、パラメータ（距離・部位・アニメ名・ノード名）の差し替えが必要

| ファイル | 差し替える値 |
| --- | --- |
| `core/init/` | 部位耐久値計算ブロック（部位の数だけ繰り返し）、固有スコア 0 リセット、待機アニメ名 |
| `core/tick/on_relax/start`, `update_caution` | 発見距離 `DistNear` / `DistFar` / `Fov`、加算値 |
| `core/tick/on_caution/update_search` | 同上（`Fov:170.0` 系） |
| `core/tick/on_battle/start_ambush` | ambush 怯みの呼び出し先 |
| `core/tick/on_battle/interact/on_attack_object` | 建築物破壊時のキャンセル先アニメ（→ Q-16） |
| `core/tick/effect_anger` | 怒り演出のロケータ名・パーティクル（→ Q-12） |
| `core/tick/animation/change/main` | 待機アニメ名（`idle` / `idle_relax`）、飛行時分岐の有無 |
| `core/tick/animation/change/on_relax/main` | 生態行動アニメ名・確率 |
| `core/tick/animation/change/play/turn` | 旋回アニメ名（`turn_l` / `turn_r` 等） |
| `core/damage/reaction/anger`, `counter`, `stun`, `paralysis`, `ambush`, `head`, `body` | 怯みアニメ名、相殺時のアニメ、部位破壊呼び出し先 |
| `core/damage/break/head` | 破壊時のモデル差し替え関数名 |
| `core/util/apply_blink`, `end_blink` | まばたき対象ノード名・item_model 名、怒り/部位破壊の組み合わせ分岐（→ Q-13） |
| `core/debug/interrupt` | アニメタグ一覧 |

### 1.3 区分 C — ファイルの「骨格」だけ共通、中身はモンスター固有

| ファイル | テンプレートに入れる内容 |
| --- | --- |
| `_index.d.mcfunction` | 宣言ブロックの見出しと共通タグ（Root / HitBox / Candidate / Target / Temp.Damage / Break）。部位・固有タグは差し込み |
| `core/register` | スコア定義 → `MonsterData` → `DefenceData` → `AttackData` の 4 ブロック構成と remove→append 定型。値は差し込み |
| `core/damage/damage` | 処理順 1〜9（spec §3.8）の定型。部位 ID → `Mns.Temp.Damage.<Part>` の行と怯み優先度は差し込み |
| `core/tick/animation/change/on_battle/*` | `main` の行動回数加算 → 距離帯委譲の骨格のみ |
| `core/tick/animation/change/play/main` | `Anim.<技名>` → tween 行の繰り返し形式 + 末尾の掃除処理 |
| `core/tick/animation/event/main` | `.playing` 判定行の繰り返し形式 |
| `core/tick/animation/event/<anim>/{main,attack,end}` | 1 グループ分の雛形（frame 新スコア名・`alignment_start.m`・`apply_attack.m`・`end` → `change/main`） |
| `core/util/models/*`, `core/util/phase/*` | `as_node` で item_model を差し替える 1 行の形式のみ |

### 1.4 2 体のみ / 1 体のみに存在するもの（テンプレート対象外・参考扱い）

- dino + ranposu のみ: `change/main_bak`（不要・作らない）、`change/play/tail`、`on_battle/interact/on_search_object`（→ Q-16）
- valk のみ: `damage/reaction/flying`・`general`・`anger_end`、`on_battle/attack/none`・`wing_left`・`wing_right`、`break/wing_l`・`wing_r` など
  → **reus は翼・飛行を持つ想定のため、valk の飛行・翼系ファイルは reus 用の「参考実装」として扱う**（テンプレートには入れない）。

---

## 2. テンプレートの形式

### 2.1 プレースホルダ

| プレースホルダ | 意味 | reus での値 |
| --- | --- | --- |
| `{{name}}` | 小文字 prefix（データパック名・AJ 名前空間） | `reus`（→ Q-01） |
| `{{Upper}}` | パスカルケース（タグ・スコア） | `Reus`（→ Q-01） |
| `{{uid}}` | Uid | → Q-02 |
| `{{display_name}}` | 日本語表示名（コメント・`say`） | → Q-03 |
| `{{pack_desc}}` | `pack.mcmeta` の description 用英名 | → Q-03 |
| `{{#parts}}…{{/parts}}` | 部位ごとに繰り返すブロック（`{{Part}}` / `{{part}}` / `{{part_id}}`） | → Q-07 |
| `{{anim.idle}}` 等 | 共通ファイルが参照するアニメ名 | → Q-10 |

- 置換はテンプレートエンジンを入れず、**Claude が手作業で（Write で）展開する**前提。繰り返しブロック記法は人間が読むための目印。

### 2.2 テンプレートの置き場所

**Q-T1. テンプレートをどこに・どの形式で残しますか？**
- 案 1（推奨）: `ai_docs/monster/template/` 以下に、データパックと同じディレクトリ構造で `*.mcfunction.tmpl` として置く。拡張子を変えるので Spyglass やサーバーに読み込まれない。
- 案 2: ファイルは作らず、本ドキュメント（または別の md 1 本）にコードブロックとして全文を載せる。
- 案 3: テンプレートは作らず、valk を直接コピー → 置換して reus を作る（今回だけ速いが、次のモンスターで再利用できない）。
- ※ `datapacks/` 直下に `mhdp_monster_template/` を置く案は、サーバーがデータパックとして読み込むため**非推奨**。

A: 案1。mhdp_monster_template/ を作成する
> 確定（2026-10-25）: `ai_docs/monster/template/mhdp_monster_template/` に、データパックと同じ構造で `*.mcfunction.tmpl` として置く。

**Q-T2. テンプレートに区分 C（骨格のみ）のファイルも含めますか？**
- 含める場合、中身は `# TODO: 部位ごとに記述` などのコメントだけを持つ雛形になる。

A: 含める。上記ファイルを作らないと正常に動作しないため。

ただし、以下は不要とする。

- core/tick/animation/event/<anim>
- core/util/models/*
- core/util/phase/*

---

## 3. 作業ステップ

各 Step の完了時に `ai_docs/monster/reus/creation_progress.md`（トラッカー。Step 0 で作成）を更新し、commit 推奨タイミングを通知する。

### Step 0 — 準備
- [x] 本計画の Q に回答（**最低限 Q-01〜Q-10 と Q-T1** が Step 2 着手の前提）
- [x] `ai_docs/monster/reus/creation_progress.md` を作成（valk の `migration_progress.md` と同形式。「仮値 / 確定値」を区別して記録する）
- [x] 内容仕様書 `ai_docs/monster/reus/spec.md` を `monster_spec_template.md` から作成するか決める（→ Q-20）

### Step 1 — 共通テンプレート作成（Q-T1 の回答に従う）
- [x] 区分 A のファイルを valk ベースでテンプレート化（コメントの `@within` を正しい呼び出し元に統一）
- [x] 区分 B のファイルをテンプレート化（パラメータ部を `{{...}}` 化）
- [x] 区分 C の骨格をテンプレート化（Q-T2 次第）
- [x] `pack.mcmeta`（`min_format`/`max_format` = `107.1`）と `advancement/toast_break.json` のテンプレート
- [x] `ai_docs/README.md` のファイル一覧にテンプレートを追記
- 💾 commit 推奨: 「共通テンプレート追加」

### Step 2 — テンプレート展開（reus の骨格生成）
- [x] `mhdp_monster_reus/pack.mcmeta`、`data/mhdp_monster_reus/` を区分 A / B のテンプレートから生成
- [x] AJ エクスポート成果物 `data/animated_java_reus/` の配置確認（→ Q-04。**中身は Read / Grep しない**）
- [ ] この時点ではアニメ未実装でも、召喚 → 待機ループ → 発見 → 戦闘フェーズ遷移 → remove が通る状態を目標にする
- [x] `grep -rnP '\S  +\S'`（コメント行除外）でトークン間の連続スペースを確認
- 💾 commit 推奨: 「reus 骨格生成」

### Step 3 — reus 固有のデータ・被弾処理（spec の Stage 1〜4 相当）
- [ ] `_index.d` / `core/register`（`MonsterData` / `DefenceData` / `AttackData`）
- [ ] `core/init/` の部位耐久値ブロック
- [ ] `core/damage/damage` + `reaction/*` + `break/*`（飛行時は共通 `reaction_flying` / `death_flying`）
- [ ] `core/util/models/*`（怒り・部位破壊のモデル差し替え）、`apply_blink` / `end_blink`
- 💾 commit 推奨: 「reus データ登録・被弾処理」

### Step 4 — 行動選択 + アニメーションイベント（Stage 5 相当・グループ単位で反復）
- [ ] `change/on_battle/*`（距離帯・確率・怒り分岐）、`change/play/main`、`play/turn`
- [ ] `event/main`（全アニメの `.playing` 判定行）
- [ ] `event/<anim>/*` をグループごとに実装。各グループ着手前に frame 番号・ロケータ名を確認する（→ Q-21）
  - frame スコアは `animated_java_reus.reus.<anim>.frame`、ロケータは `at_locator` / `as_locator`、軸合わせは `alignment_start.m` / `alignment`、地割れは `{ObjectId:16}`（CLAUDE.md の記述ルール準拠）
  - `cuboid_preview.m` はコメントアウトせず有効なまま残す
- 💾 commit 推奨: グループのバッチごと

### Step 5 — 弾 / VFX（`assets:object/`）と仕上げ
- [ ] reus 固有 object（火球など）を ObjectId `1002x` 帯で作成（→ Q-15）。`summon/debug.mcfunction` も用意
- [ ] `core/debug/interrupt` のアニメタグ一覧を全技分に
- [ ] `mhdp_core` 側の連携確認（クエスト・素材テーブル・図鑑が Uid を参照しているか）（→ Q-02）
- [ ] 完了チェックリスト（`new_monster_creation_guide.md` §4）
- 💾 commit 推奨: 「reus 実装完了」

---

## 4. 質問一覧（ユーザー記入欄）

### 4.1 基本情報（Step 2 の前提）

**Q-01. 名前は `name = reus` / `Upper = Reus` で確定でよいですか？**
（データパック名 `mhdp_monster_reus`、AJ 名前空間 `animated_java_reus`、タグ `Mns.Root.Reus` になる）

A: 確定

**Q-02. Uid は既存の `1002` を引き継ぎますか？**
`monster_datapack_spec.md` §4.1 では reus = 1002。クエストや `mhdp_core` 側が 1002 を参照している場合、変えると連携先の修正が必要になる。

A:　引き継ぐ

**Q-03. 表示名・翻訳関連の値を教えてください。**

| 項目 | 値 |
| --- | --- |
| 日本語表示名（`ShowName`、例: 火竜） | |
| `pack.mcmeta` description 用の英名（例: Rathalos） | |
| `NameId`（例: `monster.reus.name`） | |
| `Icon`（UI 用アイコン文字、例: `uE013`） | |
| `LootTable` | |

A: 上記で正しい
> 確定（2026-10-25）: 既存アセットに合わせる。`ShowName` = `{"translate":"monster.rathalos.name"}` / `NameId` = `monster.rathalos.name` / `Icon` = `uE012`（`uE013` は dino が使用中）/ `LootTable` = `mhdp_items:materials/reus/random_all` / 日本語表示名 = 火竜 / 英名 = Rathalos

**Q-04. 新しい AJ のエクスポート状況を教えてください。**
- エクスポート先は `mhdp_monster_reus/data/animated_java_reus/` で、モデル名（`animated_java_reus:<model>/...` の `<model>`）は `reus` ですか？
- 既にエクスポート済みですか？（未エクスポートの場合、Step 2 は AJ 呼び出し部分をプレースホルダのまま進める）

A:　未エクスポート

**Q-05. 部位破壊トーストの `icons/reus` アイテムモデルはリソースパック側に存在しますか？**（無ければ仮のアイコンを指定）

A: 存在する

**Q-06. `MonsterData` のステータス値を教えてください。**（空欄の項目は Claude が dino / valk の値を「仮値」として提案します）

| 項目 | 値 |
| --- | --- |
| `Hp` | |
| `ShowHp` | |
| `StunDamage` / `TireDamage` | |
| `AngerDamagePer` / `AngerTimer` / `AngerAttackMult` / `AngerSpeed` | |
| `ParalysisDamage` / `ParalysisTimer` | |
| `PoisonDamage` / `PoisonTimer` / `PoisonEffectDamage` | |
| `BombDamage` / `BombEffectDamage` | |
| `FlashBombEnable` / `SoundBombEnable` | |
| `ParalyseTrapEnable` / `ParalyseTrapTimer` | |
| `HallTrapEnable` / `HallTrapTimer` | |
| `CounterDamage` | |

A: すべて dino の値を仮値として使用する

### 4.2 部位・肉質（Step 3 の前提）

**Q-07. 当たり判定の部位構成と部位 ID（`DefenceData` の行 index）を教えてください。**
部位ごとに `Mns.HitBox.Reus.<Part>` タグ、`Mns.Reus.<Part>.Damage(.Max)` スコア、`on_battle/attack/<part>` が作られる。

A:

翼はMinecraftの仕様上、正確な当たり判定を作るのが難しいので、部位としては存在しない

| 部位 ID | 部位名（例: Head） | 肉質 [切,打,弾,火,水,雷,氷,龍] | `<Part>PartDamage` (%) | 部位破壊 する/しない |
| --- | --- | --- | --- | --- |
| 0 | Head | [70,75,62,0,15,25,10,30] | 12% | する |
| 1 | Body | [35,40,25,0,5,15,10,15] | 15% | する |
| 2 | Tail | [50,40,35,0,5,20,10,25] | 15% | する |
| 3 | LegRight | [40,42,35,0,8,12,10,17] 10% | しない |
| 4 | LegLeft | [40,42,35,0,8,12,10,17] | 10% | しない |

> 確定（2026-10-25）: 脚の部位名は dino に合わせて `LegR` / `LegL`（`Mns.HitBox.Reus.LegR`、`Mns.Reus.LegR.Damage`、`LegRPartDamage`）。

**Q-08. 部位破壊の内容を教えてください。**（例: 頭 = 傷がつくモデル差し替え、翼 L/R = 翼膜破れ、尻尾 = 切断）
- 尻尾切断がある場合、切断された尻尾は object として作りますか？

A:
- Head: 頭のモデル差し替え
- Body: 胴体のモデル差し替え
- Tail: 切断

**Q-09. 特殊な状態・フェーズはありますか？**（例: 飛行状態 `Mns.State.IsFlying`、毒爪、怒り時の口元の炎、dino の赤熱化のような部位状態）
- 飛行中に被弾したときは共通の `reaction_flying`（墜落）、討伐時は共通の `death_flying` を使う想定でよいですか？

A: 無し

### 4.3 共通ファイルが参照するアニメーション・ノード（Step 2 の前提）

**Q-10. 共通ファイルから参照される AJ アニメーション名を教えてください。**（存在しないものは「無し」と記入）

| 用途 | 参考（dino / ranposu / valk） | reus のアニメ名 |
| --- | --- | --- |
| 非戦闘待機 | `idle_relax` | 同じ |
| 戦闘待機 | `idle` / `lance_idle` | `idle` |
| 非戦闘歩き | `walk_relax` | 同じ |
| 生態行動 | `ecology_relax(_short/_long)` | 同じ |
| 警戒（探索） | `search` | 同じ |
| 発見時の咆哮 | `voice` | `land_voice` |
| 怒り移行 | `anger` | `land_anger` |
| 旋回 左 / 右 | `turn_l` / `turn_r` | `land_turn_XXX` |
| 怯み（頭 / 胴 / 部位ごと） | `damage_head`, `damage_left/right` 等 | 同じ |
| 相殺怯み | `damage_counter_*_start` | 同じ |
| ダウン（スタン・部位破壊） | `damage_down(_left/_right)` | 同じ |
| 麻痺 | `state_paralysis(_start)` | 同じ |
| 討伐 | `death` | 同じ |
| 飛行中の討伐 | `death_flying` | 同じ |
| 乱入登場（あれば） | — | |

A:
上記表に記入。ただし、animation/event の生成は不要
> 確定（2026-10-25）: 旋回は `land_turn_l` / `land_turn_r`。

**Q-11. 頭上の "!"（発見表示）と、まばたきを適用する頭部の部位・ノード名を教えてください。**（例: "!" は頭 HitBox に ride、まばたきノード = `head_upper`）

A: 
- HitBox: dinoと同じにする
- ノード: `head_upper`

**Q-12. 怒り中の演出（`effect_anger`）はどうしますか？**（例: `pos_head` ロケータから口元の火の粉パーティクル。ロケータ名も記入）

A: pos_headから火の粉パーティクル

**Q-13. まばたき・怒り・部位破壊で差し替える item_model のバリアント名を教えてください。**（例: `minecraft:aj_sub/reus/head_upper_blink`、怒り時 `..._anger`、破壊時 `..._break`）

A:
想定は下記の通りだが、逐次追加するので実装の必要はない
- まばたき: head_upper_blink
- 怒り: 変更しない
- 破壊: head_upper_break など

### 4.4 行動・攻撃（Step 4 の前提）

**Q-14. 攻撃（技）一覧を教えてください。** `AttackData` の `Name` と `Anim.<技名>` はこの表から確定させる。

| 技名（Name） | AJ アニメ名 | 左右対称 | 部位（head/body/tail/wing_*/none） | 属性 | 状態異常 | 備考（突進・ブレス・飛行中など） |
| --- | --- | --- | --- | --- | --- | --- |
| | | | | | | |

A:
逐次手動で命令するので、作成の必要はない。
随時AttackData、Animタグを追加できるよう、作成中メモリに記憶すること

**Q-15. 弾・VFX（火球ブレス・爆発など）で新規 object が必要なものを教えてください。** ObjectId は `1002x` 帯を予定。既存の汎用 object（`0016.ground_crack` 等）で足りるものは流用します。

A:
逐次手動で命令するので、作成の必要はない。

**Q-16. 建築物（拠点オブジェクト）との相互作用はどうしますか？**
- dino / ranposu: 前方の建築物を探して攻撃する `on_search_object` あり
- valk: `on_search_object` なし、攻撃キャンセル（`interact/reaction/cancel_attack_*`）のみ
- reus はどちらに合わせますか？

A:
逐次手動で命令するので、作成の必要はない。

**Q-17. 行動選択の距離帯・確率を教えてください。**（例: 近距離 ..8 / 中距離 8..16 / 遠距離 16..、飛行移行の頻度、怒り時のみ使う技）
未指定なら dino の `change/on_battle/*` を参考に仮値を提案します。

A:
dino を参考に仮値を使用

**Q-18. 発見ロジックの距離・視野角は既定値（`DistNear:12, DistFar:30, Fov:60.0` / 警戒時 `Fov:170.0`）でよいですか？**

A:
dino を参考に仮値を使用

### 4.5 進め方

**Q-19. 乱入（`core/summon/intrusion`）は待機アニメで初期化する valk 方式でよいですか？** 専用の登場アニメ（飛来など）があればアニメ名を記入。

A:
問題なし

**Q-20. 内容仕様書 `ai_docs/monster/reus/spec.md`（`monster_spec_template.md` 形式）を別途作りますか？** それとも本計画の Q-07〜Q-18 の回答を仕様書の代わりにしますか？

A:
別途作成

**Q-21. アニメーションイベントの frame 番号・ロケータ名はどう受け取りますか？**（CLAUDE.md により `animated_java_reus/` は Read / Grep できない）
- 案 1: グループ着手前にユーザーが frame 番号とロケータ名を書いて渡す
- 案 2: 仕様書（Q-20）の各グループ欄にあらかじめ書いておく

A:
アニメーションイベントは、ユーザが手動で実装予定

**Q-22. Step 4 は何グループずつのバッチで進め、どこで実機確認を挟みますか？**（`new_monster_creation_guide.md` §2.2 では、単純なグループでも実装前に 1 回確認を挟むのが基本）

A:
基本、1アニメーション1グループとして、毎回確認を挟む

---

## 5. 成果物一覧（予定）

| パス | 内容 | Step |
| --- | --- | --- |
| `ai_docs/monster/reus/creation_plan.md` | 本計画 | — |
| `ai_docs/monster/reus/creation_progress.md` | 進捗トラッカー | 0 |
| `ai_docs/monster/reus/spec.md` | 内容仕様書（Q-20 次第） | 0 |
| `ai_docs/monster/template/**`（Q-T1 次第） | 共通テンプレート | 1 |
| `mhdp_monster_reus/pack.mcmeta` | `107.1` 形式 | 2 |
| `mhdp_monster_reus/data/mhdp_monster_reus/**` | モンスターロジック | 2〜5 |
| `mhdp_core/.../assets/object/1002x.reus_*` | reus 固有 object | 5 |

## 6. リスク・注意点

- **旧 reus の削除状態**: 作業ブランチ `feature/new_reus` では旧 `mhdp_monster_reus/` が削除扱い（`git status` の `D`）になっている。新規作成で同じパスにファイルを置くと、git 上は「旧ファイル削除 + 新ファイル追加」が混ざった差分になる。commit の切り方はユーザー判断。
- **`intrusion` のコピペ不具合**: dino / ranposu 版を流用しない（区分 A で valk 版を採用済み）。
- **frame スコア名**: reus は旧 AJ 形式（`aj.<anim>.frame`）だったが、新規作成では必ず `animated_java_reus.reus.<anim>.frame` を使う。旧名のままだとエラーにならずに条件が常に偽になる。
- **仮値の扱い**: 肉質・耐久値・判定サイズなどの初出の値は、トラッカー上で「仮値」と明記し、実機確認後に「確定値」へ更新する。
