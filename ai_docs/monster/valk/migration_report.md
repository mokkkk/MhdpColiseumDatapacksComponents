# mhdp_monster_valk 新形式移行 完了レポート

> **位置づけ**: `migration_progress.md`（時系列の生ログ・作業中の判断メモ）を元に、移行完了後にトピック別へ再構成した**まとめドキュメント**。生ログはそのまま保持し、こちらは「valkに何をしたか」を後から参照する用途に使う。
> 汎用化された実行手順（他モンスターにも適用できる知見）は `ai_docs/monster/migration/monster_migration_playbook.md` を参照。本レポートは valk 固有の実装詳細に特化する。

## 参照
- 生ログ（時系列・判断理由込み）: `ai_docs/monster/valk/migration_progress.md`
- 汎用化プレイブック: `ai_docs/monster/migration/monster_migration_playbook.md`
- 技術仕様: `ai_docs/monster_datapack_spec.md`
- 新旧差分表: `ai_docs/monster/migration/monster_datapack_comparison.md`
- 移行元: `mhdp_monster_valk_bak`（旧形式、未move・残置）
- 新形式テンプレ: `mhdp_monster_dino`（Uid 1003）, `mhdp_monster_ranposu`（Uid 1001）

---

## 1. 概要

| 項目 | 内容 |
|---|---|
| 対象 | `mhdp_monster_valk`（天彗龍 / Valstrax、Uid 1004） |
| 作業ブランチ | `feature/update_valstrax` |
| 期間 | 2026-09-01 〜 2026-09-23 |
| 移行元 | `mhdp_monster_valk_bak`（旧形式、`pack_format:81`、`#minecraft:load`/`#minecraft:tick` タグ依存） |
| 移行先構造 | 新形式（`mhdp_monster_dino`/`ranposu` 準拠、`mhdp_monsters:core/super`/`switch`/`util` に処理委譲） |
| 最終状態 | Stage1〜4 完了 / Stage5（5-A・5-B・5-C）**85/85 グループ完了** / Stage6 必須項目完了（`interrupt` はユーザー指示により対象外） / Stage6-S（弾・VFX）9 object 完全実装＋最終棚卸し完了 |
| モチーフ | 2形態切替（龍気形態＝ `lance_*` / 彗龍形態＝ `shoot_*`）を持つ飛行モンスター。射撃・彗星召喚・翼技を主体とする |

---

## 2. Stage 別実施内容

### Stage 1 — メタ/register/load/_index.d
- `pack.mcmeta`（107.1）、`load.mcfunction`、`_index.d.mcfunction`、`core/register.mcfunction`。
- NameId: `monster.valk.name`（ShowName: `monster.valstrax.name`）。resource pack への `monster.valk.name` キー追加が必要。
- **AttackData 23 エントリ**を新スキーマで登録:
  - head: `Bite`
  - body: `Vertical.Hand`, `Upper`, `DashAttack`, `Tackle`, `JetTackle`
  - none: `Beam`, `Comet`, `Shot`, `Bomb.Side`, `Bomb.Forward`
  - 翼槍6技 × 左右（`wing_right`/`wing_left`）: `Spear`, `SpearSpin`, `Vertical`, `VerticalS`, `Sweep`, `Sweep.Anger` の `.Left`/`.Right`
  - `ObjectDamageValue` は全エントリ `#TODO`（ユーザー手動調整待ち、未解消）
- **部位構成**: `head0 / body1 / tail2 / armR3 / armL4 / legR5 / legL6 / wingR7 / wingL8 / bodySp9`（`bodySp9` は龍気吸引中の胸専用）。破壊対象は頭・尻尾（切断）・両翼。

### Stage 2 — summon/init/remove/death
- `core/summon/summon.mcfunction`（`intrusion.mcfunction` も同一フロー）、`core/init/.mcfunction`（10部位耐久初期化 + `lance_idle` 開始）、`core/remove/remove.mcfunction`、`core/death/death.mcfunction`。
- 弾/VFX の kill 処理は Stage 6-S 完了時に `execute as @e[tag=Asset.Object.Valk] at @s run function api:object/remove` として確定（当初は `#TODO` で保留していた）。

### Stage 3 — tick骨格 + フェーズ
- `core/tick/{tick,main}.mcfunction`（dino形式）、`effect_anger*`（`at_locator` 記法）、`on_relax`/`on_caution`/`on_battle` 系（`check_target`/`update_target`/`update_hate`/部位別 `attack/*`）。
- `update_caution`/`update_search` の FOV/距離は ranposu の値を流用（valk固有の調整は未実施、TODO扱い）。

### Stage 4 — damage / reaction / break
- `core/damage/damage.mcfunction`、`reaction/*`（`anger`/`anger_end`/`counter`/`stun`/`paralysis`/`body_sp`/部位別/`ambush`/`general`/`flying`）、`break/*`（頭・両腕・両翼・尻尾切断）。
- **バグ修正**:
  - 旧 `stun` の `aj.valk_aj.animation.lance_down_right.playing`（存在しないアニメ名）→ `lance_down_r` に修正。
  - `arm_l`/`leg_l`/`leg_r` の IsDown 判定が `Mns.Valk.ArmR.Damage.Count`（腕右固定）を誤参照 → 各部位固有の Count 参照に修正。
- **旧挙動踏襲の判断**: 腕の初回staggeringで `arm_r_break`/`arm_l_break` を無条件発動する挙動は、比較表上の破壊部位リスト（頭/尻尾/両翼）と食い違うが、旧valkの実挙動をそのまま踏襲（変更していない）。
- **省略したファイル**（旧コードが他モンスターの丸コピペ・未呼び出しと判明）: `reaction/sp.mcfunction`（ranposuコピペ）、`reaction/flying_tail.mcfunction`（reusコピペ）、`reaction/macro/m.summon_tail.mcfunction`（尻尾切断オブジェクト設置。Stage6-Sの共通object待ちTODOへ）。

### Stage 5-A — change/*（行動選択ロジック）
- `change/main`（Phase分岐）、`on_relax`/`on_caution`/`on_battle`、抽選ロジック（`check_player_situation.m` → 重み → `decide_animation.m {Monster:"valk"}` → action_id分岐）。
- **判断**: dino/ranposuの `check_player_situation.m {Tag:"Mns.<Upper>.Target"}` は実際のタグ（`Mns.Target.<Upper>`）と食い違う既知の誤記で、状態別重み上書きが機能していない。valkでは**正しい `Mns.Target.Valk`** を使用し、旧valkが持っていた正面/背面/側面の重み調整を機能させた（テンプレの誤記をそのまま踏襲しなかった唯一の箇所）。
- 側面判定は `!IsForward,!IsBack`（dino near と同一。middle/farの`IsForward,IsBack`併記はdinoのバグと判断し踏襲せず）。
- 威嚇閾値（`ActCount.Idle`）は旧valkの値である18を維持。
- `play/spear_to_spin`/`play/vertical_turn` はどの選択からも呼ばれない（旧同様、`debug/interrupt`用として残置。interrupt自体は今回未実装）。

### Stage 5-B — event/main.mcfunction（ディスパッチャ）
- 全85グループの `.playing` 判定行を配線完了。「## 龍気形態」「## 彗龍形態」の2大セクション構成。

### Stage 5-C — event/<group>/*（85グループ）
全グループ完了。詳細はカテゴリ別に §3 にまとめる。

### Stage 6 — util / models / phase / debug / advancement
- `core/util/fetch_player.mcfunction`（新設）、`apply_blink`/`end_blink`（頭部モデル4状態）、`show_bossbar`/`show_toast`/`hide_toast`。
- `core/util/models/*` 17ファイル: 旧 `on passengers ... white_dye + custom_model_data` を `as_node` 経由の `item.components."minecraft:item_model"` 書き換えへ変換。**モデルIDは全て仮プレースホルダのままで、AJ再エクスポート後に実際のID差し替えが必要**（未解消・既知のTODO）。
- `core/util/phase/*`: 原則「不要」と判断（旧phase/はdinoの丸コピペで熱化/風化ギミック用、valkには該当機能なし）。**唯一の例外**: 龍気吸引中の胸部肉質変化（PartId 1/3/4↔9切替）を `phase/charge_start.mcfunction`/`charge_end.mcfunction` として新設（`lance_charge_*` 専用の共有ロジック切り出し）。
- `core/debug/interrupt.mcfunction`/`interrupt_anger.mcfunction`: **ユーザー指示により実装不要（対象外で確定）**。
- `advancement/toast_break.json`: dino/ranposuと同一テンプレートで新規作成（`item_model:"icons/valk"`, `title:"部位破壊"`）。approve済み。

### Stage 6-S — 弾/VFXの assets:object 移行
9個の object（`10040`〜`10048`）を `mhdp_core/data/assets/function/object/` に実装。詳細は §4 参照。

---

## 3. アニメーショングループ実装詳細（カテゴリ別）

### 3.1 待機・移動・旋回系（lance_idle, lance_move/move_start/moveback, lance_turn_l/r, lance_search, shoot_idle/move/move_start/moveback/turn_l/turn_r, shoot_sault_before, lance_idle_short, lance_to_shoot, shoot_to_lance）
- `lance_move`: 移動目標マーカー `Mns.MovePos.Valk`（area_effect_cloud）への軸合わせに精密軸合わせ `turn_to_target_accurate`（毎tick）を使用。終了判定は `run return run function .../end` でショートサーキット化、ロスト判定に `distance=..64` の上限を追加（ユーザー修正）。
- `lance_move_start`/`lance_moveback`/`lance_turn_l/r`: `alignment_start.m`+`alignment` に統一。`lance_turn_r` は旧コードで軸合わせ範囲呼び出しに `at @s` が欠けていたバグを修正。
- **shoot系の対応する8グループ**は lance系と完全同型のため確立済みパターンをそのまま適用。`shoot_turn_l/r` も同種の `at @s` 欠落バグを修正。
- **`shoot_step`（最も複雑）**: 旧 `move_to_target_calc`/`move_to_target_move`（非推奨、内部で `Temp.Move.Target.Marker` を決め打ち）を全面書き直し。移動は `vector_move_start.m {TargetType:"area_effect_cloud",TargetTag:"Mns.MovePos.Valk"}` に置換。回転は `Temp.Rotate.Target.Marker` を維持しつつ、`alignment_start.m` が内部で同名タグをスクラッチマーカーとして使う衝突バグを発見（`Mns.Valk.Step.RotateTarget` という中間タグへ一旦付け替えて回避）。
- **lance_idle_short**: 攻撃・軸合わせなしの短縮待機（`lance_upper` の終了から直接遷移）。
- **lance_to_shoot / shoot_to_lance**: 形態変化。状態タグ処理を `core/util/phase/to_shoot.mcfunction`/`to_lance.mcfunction` に切り出し。

### 3.2 lance_spear系（2連突き・翼槍回転斬り、4グループ）— 確立パターンの起点
- 攻撃判定は `at_locator {name:"pos_wing_*_N"}` で `hit_*.mcfunction` を呼び、内部で `apply_attack.m`。旧の球状判定（`distance=..3.5`）を Scale 3.0〜3.5 の箱型に近似。
- 複数回ヒット技（突き→回転斬り）は判定区間ごとに `start_attack.m`/`end_attack` で個別に挟む方針をここで確立。
- 各 `hit_*.mcfunction` に `apply_attack.m` と同一引数の `cuboid_preview.m` を配置する方針もここで確立（以降全グループに適用）。
- **バグ修正**: `lance_spear_to_spin_r` の frame33-38/35-37 演出が左翼ロケータ（`pos_wing_l_*`）を誤参照（右回転技なのに）→ 右翼へ修正。

### 3.3 lance_vertical系（翼槍叩きつけ、6グループ）
- 着弾AoE（`attack.mcfunction`）+ お手判定（`attack_hand.mcfunction`、`l/r`のみ、相殺不可）+ 振り下ろし中判定（`attack_swing`+`hit_swing`、新設）の3層構造を確立。
- 地面のひび割れ演出を `api:object/summon.m {ObjectId:16}` に統一（旧マーカー方向指定方式を廃止）した最初のグループ。CLAUDE.mdへのルール追記の起点。
- 龍閃赤フラッシュVFXは当初 `particle flash{color}` で代替、`10047.valk_red_flash` 実装完了後に `{ObjectId:10047}` へ差し戻し。
- **バグ修正**: `lance_vertical_turn_r` が左翼の値（`pos_wing_l_3`、`positioned ^1.2`）を誤参照 → 右翼へ修正。

### 3.4 lance_upper系（翼槍突き上げ、2グループ）
- 前方一直線の判定を縦長1ボックス（`apply_attack.m {Upper}`）に統一、演出は別途11点の `attack_effect.mcfunction`（ダメージなし）。
- 突き上げ本体・お手判定ともに相殺不可（`start_attack`/`end_attack` を挟まない）。
- **バグ修正**: `lance_upper_l` のモデル演出が `ignite_start_right`/`ignite_end_right`（右）を誤参照 → 左へ修正。

### 3.5 lance_biim系（龍閃、2グループ）
- Thunder(10048)/Beam(10045)/Jet(新規VFX、実体は10047へ `IsBeamVfx` Override追加で代替) の3種オブジェクトを新規設計。
- 攻撃判定は最終的にユーザーが disk 上で直接実装（`apply_attack.m` による単一縦長ボックスへの統一、Claude側の中間案は不採用）。
- **移植しなかったバグ**: 旧 `lance_biim_1/main` の `lance_biim_2.frame` 参照（自身が再生中でないアニメのframe参照、コピペミスと判断し死んだコードとして扱った）。

### 3.6 lance_bite / lance_tackle / lance_dashattack
- `lance_bite`: `start_attack.m`→`attack`(frame23-30毎tick)→`end_attack` の単純構成。判定サイズは旧の`distance=..3.8`をScale3.8で近似。
- `lance_tackle`: 蛇行につき2ヒット窓（frame25-29/41-45）、それぞれ独立して`start_attack.m`/`end_attack`。
- `lance_dashattack`: 旧軸合わせがdead codeのため軸合わせなし。2段攻撃（単発大判定+突進中判定）を同一相殺ウィンドウ内に収める。

### 3.7 lance_flytackle系（滑空突進、4グループ）
- `start`→`本体`→`repeat`(急停止・旋回・再発進)→`end`の一連の流れ。`Mns.Valk.JetCount` を消費して分岐。
- 攻撃判定に `start_attack`/`end_attack` を挟まない（旧コードに存在せず、相殺不可・連続判定のまま踏襲）。
- **レビューで訂正**: `move_start.mcfunction`（`move_to_target_calc` 使用）は非推奨APIレビュー漏れと判明 → `vector_move_offset_start.m`（自己相対オフセット `^14`）に置換。
- **移動方式の使い分け方針をここで確定**: `vector_move`系＝固定tick正確移動、`MovePos`方式＝不定tickおおざっぱ移動（プレイヤー追従）。flytackle系は後者が正しいと確認（§4関連バグ修正参照）。

### 3.8 lance_charge系（龍気吸引、4グループ）
- `charge_start`(助走)→`charge`(吸引ループ、`ChargeCount`1-6)→`charge_end`(解放)、ダメージ中断で`charge_damage`へ割込み遷移。
- 胸(BodySp/PartId9)への肉質変化を `core/util/phase/charge_start.mcfunction`/`charge_end.mcfunction` に切り出し（Stage6で唯一のphase/新設例）。
- RedFlash/Bombの生summonを `{ObjectId:10046}`/`{ObjectId:10047,Scale:7}` へ置換。

### 3.9 lance_damage系（怯み、17グループ）+ lance_down系（4グループ）
- 部位別怯み7種は単純な「frame監視→接地→`change/main`」構造。全グループ共通でframe1に `tag @s remove Mns.Valk.State.IsShoot`（被弾時は彗龍形態を強制解除）。
- ダウン(`lance_damage_down_l/r`)は `change/main` を経由せず `lance_down_l/r` へ直接tween。
- 飛行中怯み(`lance_damage_flying`)は `vector_move_offset_start.m`（dinoの`damage_flying/main`実例に準拠）へ置換。
- 反撃硬直系7グループは頭部/右翼始動と左翼始動(`_mirror`系)で非対称構造（旧仕様のまま踏襲）。
- `lance_down_l/r`→`lance_down_end_l/r` はダウンカウントのループ/終了分岐。

### 3.10 lance_anger / lance_death / death_flying / lance_voice / state_paralysis
- `lance_anger`: dinoの`anger`グループが`Voice`と同じ`apply_attack_distance.m`方式だったことを確認し同方針を適用。
- `lance_death`/`death_flying`: 最終アニメ、攻撃・軸合わせなし。`death_flying`の移動を`vector_move_offset_start.m {Tick:6,IsAdjustLand:"true"}`へ置換（dino実装に準拠）。
- `lance_voice`: ダメージ方式をユーザー指示で旧怯み専用API（`mhdp_core:player/damage/voice/main`）からdino準拠の`apply_attack_distance.m`方式（`Voice`AttackData、対モンスター判定を新規追加）へ変更。
- `state_paralysis`: 唯一frame監視を使わずタイマー減算で終了するグループ。**バグ修正**: `Mns.State.IsParalysis`タグが`end`で解除されない旧仕様不具合を修正。

### 3.11 shoot_vertical系 / shoot_sweep系（翼叩きつけ・薙ぎ払い、6グループ）
- `shoot_vertical_l/r`はlance_verticalと同型（お手+軸合わせ+着弾AoE、後に近距離/遠距離2ボックスへ分割）。
- `shoot_sweep_l/r`・`shoot_sweep_anger_l/r`は各ロケータでの`hit.mcfunction`を1本の直方体に統合。
- **バグ修正**: `VerticalS`/`Sweep`/`Sweep.Anger`のAttackNameがlaterality無しだったものを`.Left`/`.Right`付きへ修正。`shoot_sweep`系4グループは`start_attack.m`/`end_attack`が抜けていたものを追加（ユーザー指摘）。

### 3.12 shoot_bomb_forward / shoot_bomb_side / shoot_shot_forward / shoot_shot_horizon
- Thunder溜め演出(6ロケータ)、`apply_attack.m`によるBomb/RedFlash複合判定。
- `10040.valk_shot`のtick/moveにシュルカーHitBoxへの命中トリガーを追加（壁/Shulkerで同一hit処理に統合）。
- Shotのフラッシュ色を`[1.000,0.300,0.300,1.00]`へ調整（ユーザー指示）。

### 3.13 shoot_sault（前方爆発・バク転突進）
- 独自のyaw回転付きtp演出（`vector_move_offset_start.m`+回転tp）による「バク転突進」。
- **バグ修正**: 対モンスター判定5点目のみ`Z:13`という非対称値だった旧コードを`Z:3`へ統一。AttackNameを誤参照の`Bomb.Side`から正しい`Bomb.Forward`へ修正。
- 5点別々の判定を1本の直方体へ統合（ユーザーレビュー）。

### 3.14 comet_phase_1〜5（彗龍形態・彗星、最終バッチ）
最も複雑なグループ群。ユーザー指示で進行順序を「①全体の動き+非object演出 → ②攻撃判定 → ③object演出（initも同時実装）」に変更。
- Phase1: RedFlash単発召喚 + Comet+Burstを"shadow"ロケータへ絶対座標系再配置（`positioned ~ ~-15 ~ rotated 180 45`）で召喚。
- Phase2: Star（初期スケール0→直接NBT編集で[64,64,1]へ成長）+ 追従パーティクル。Comet+Burst再召喚。
- Phase3: Star kill、Jet召喚+追従。
- Phase4: Jet追従継続→スケール50上書き→kill。RedFlash×4+Bomb×4連続召喚。攻撃判定は5点統合の1ボックス（`Comet`AttackName）。
- **バグ確認**: 旧`vfx_comet`/`comet_burst`/`comet_jet`の`damage.mcfunction`3種は無関係なDinoブレスダメージのコピペと確認、移植せず（実ダメージは`comet_phase_4/attack`のみ）。
- 風圧怯み（Phase1 f56）は実装方針未定のため`# TODO`のまま保留（未解消）。
- `change_text.mcfunction`の旧AJボーンタグ直接参照を`as_node`形式に変換したが、後にユーザーが disk 上でコメントアウト（無効化）。

---

## 4. 弾/VFXオブジェクト最終カタログ（`assets:object/1004N.valk_*`）

| ObjectId | 名称 | 自ダメージ | Override引数 | 用途・備考 |
|---|---|---|---|---|
| `10040` | valk_shot | あり（`apply_attack_distance.m {AttackName:"Shot"}`） | なし | 龍気形態の射撃弾。移動中はdust演出、プレイヤー/Shulker HitBox/ブロック近接でhit。狙い補正は呼び出し側が`summon.m`実行前に`positioned`/`rotated`で作成 |
| `10041` | valk_comet | なし | `Scale`（平面X/Y、Z=1固定） | 彗星本体。ダメージは`comet_phase_4/attack`側 |
| `10042` | valk_comet_burst | なし（精読確認済み） | `Scale`（平面） | 彗星の炸裂VFX |
| `10043` | valk_comet_jet | なし | `Scale`（立体・均等） | 彗星のジェット。ループ型、呼び出し側kill+300tick安全策 |
| `10044` | valk_comet_star | なし | `Scale`（平面） | 星型テレグラフVFX。ループ型 |
| `10045` | valk_beam | なし（event側で判定） | `Scale`（立体）。summon時に無条件`10045.BeamVfx`タグ付与（単一用途） | 龍閃ビーム本体。`beam_start`ロケータへスイープ追従 |
| `10046` | valk_bomb | なし | `Scale`（`comet_phase_4`でScale18使用のため追加実装） | 爆発VFX共通部品 |
| `10047` | valk_red_flash | なし | `IsLong`（ループ生存）, `IsFollow`（追従識別タグ）, `IsBeamVfx`（true で`tick/beam`実行・自動スケール拡大、Jet役として使用）, `Scale` | 最も再利用された汎用VFX。lance_upper/vertical/flytackle/biim系で使用 |
| `10048` | valk_thunder | なし | `Tag`（個体識別、例: WingR0-2/WingL0-2）, `Scale` | 雷VFX。6体同時展開、開始フレームはinit時に自動ランダム化（同期点滅防止） |

- 全9 object とも `init/summon/tick/remove/alias` の4本柱構成 + `summon/debug.mcfunction`（手動召喚デバッグ関数）を装備。
- **ダメージ方針**: object は原則VFX専用。自ダメージするのは着弾点が独立して読めない `valk_shot` のみ。
- **最終棚卸し（2026-09-23）で解消した残存TODO**（5箇所、いずれも実装漏れではなく確認漏れ）:
  - `10040/init/`: 「狙い補正未実装」TODO → 呼び出し側が`summon.m`実行前に`positioned`/`rotated`で解決済みと確認、コメント更新。
  - `10043`/`10044`/`10045`/`10048`の`tick/`: 「呼び出し側kill設計にすべきか」TODO → 各呼び出し元で既に実装済みと確認、「呼び出し側が明示的にkillするまで生存。300tickは安全策」という確定説明に更新。

---

## 5. 発見されたバグパターンの集計

| カテゴリ | 件数目安 | 代表例 |
|---|---|---|
| ヘッダーコメントの無関係コピペ | ほぼ全旧ファイル | 随所 |
| 他モンスター（dino）コピペ残留 | 複数 | `Mns.Target.Dino`参照、`vfx_comet*/damage`のdinoブレスダメージ流用 |
| AttackName laterality抜け | 3グループ系統 | `VerticalS`, `Sweep`, `Sweep.Anger` |
| 左右取り違え | 3件 | `lance_vertical_turn_r`, `lance_spear_to_spin_r`, `lance_upper_l`のignite参照 |
| 非推奨API残留（`move_to_target_calc`等） | 複数 | `shoot_step`, `lance_flytackle_repeat/end`, `lance_damage_flying`, `death_flying` |
| 軸合わせの`at @s`欠落 | 2件 | `lance_turn_r`, `shoot_turn_l/r` |
| 内部タグ衝突 | 1件（新規発見） | `alignment_start.m`の`Temp.Rotate.Target.Marker`とcaller側タグの衝突（`shoot_step`） |
| dead code（main未参照ファイル） | 多数 | 各種`turn_start.mcfunction`、`m.particle_head`の誤配置、`lance_flytackle`本体の`particle.mcfunction`等 |
| 対称データの非対称値ミス | 1件 | `shoot_sault`の対モンスター5点目のみ`Z:13` |
| AttackName誤参照 | 1件 | `shoot_sault`が`Bomb.Side`を誤参照（正しくは`Bomb.Forward`） |
| 共有object側の古いTODO残留 | 5件 | Stage6-Sバッチ1作成時点のTODOが、Stage5-Cでの呼び出し元実装により解決済みなのに放置 |
| start_attack/end_attack抜け | 1グループ系統 | `shoot_sweep`/`shoot_sweep_anger`（4グループ） |

---

## 6. 未解決・保留事項（次アクション向け）

- **`ObjectDamageValue`**: AttackData全23エントリで `#TODO` のまま。ユーザーによる手動調整が必要。
- **`apply_attack.m`の判定サイズ全般**: 旧の球状距離判定からの近似値。実機テストでの調整が前提（多くのグループで`cuboid_preview.m`は有効なまま残置済み）。
- **モデルID**: `core/util/models/*` 17ファイルすべて仮プレースホルダ。AJ再エクスポート後に `minecraft:aj_sub/valk/*` / `animated_java_valk:blueprint/valk/*` の実IDへ差し替え必須。
- **尻尾切断オブジェクト**: `reaction/break/tail_cut` は「全モンスター共通objectとして後日mhdp_core側で作成予定」のTODOのまま未解消。ObjectId未定。
- **風圧怯み**（`comet_phase_1` frame56）: 実装方針未定、コメントアウトのまま保留。
- **`core/debug/interrupt.mcfunction`/`interrupt_anger.mcfunction`**: ユーザー指示により実装対象外で確定（今後実装する場合は別途指示が必要）。
- **`update_caution`/`update_search`のFOV/距離**: ranposu値を流用したまま、valk用の調整余地あり。
- **`change/main`の軸合わせ行の要確認事項**: `store result #mhdp_temp_result`が未消費・未リセットな箇所があり、正面時の早期returnでtickが空振りする可能性が指摘されたまま（ユーザー編集中だった箇所、最終決着未確認）。
