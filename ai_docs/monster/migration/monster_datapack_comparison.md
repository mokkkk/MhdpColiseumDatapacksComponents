# 仕様比較表 — `mhdp_monster_dino` / `mhdp_monster_ranposu`（新形式） vs `mhdp_monster_valk`（旧形式）

`mhdp_monster_valk` を新形式へ更新するための差分一覧。
「新形式」列 = dino / ranposu が採っている構成（更新後の目標）。「旧 valk」列 = 現状。

凡例: ✅ 新形式に準拠 / ⚠️ 部分的 / ❌ 旧式・要変更

---

## 1. メタ情報・パッケージング

| 項目 | dino | ranposu | valk（現状） | 更新方針 |
| --- | --- | --- | --- | --- |
| `pack.mcmeta` の format | `min_format`/`max_format` = `107.1` | 同左 | ❌ `"pack_format": 81` | `min_format`/`max_format` 107.1 に統一 |
| `description` | `"For Monster Glavenus"` | `"For Monster Ranposu"` | `"火竜処理用のデータパック"`（reus からのコピペ） | `"For Monster Valstrax"` 等に修正 |
| AJ 名前空間 | `animated_java_dino` | `animated_java_ranposu` | ❌ 共有 `animated_java` に `valk_aj` リグ | `animated_java_valk` へ分離して再エクスポート |
| `data/minecraft/tags/function/` | なし | なし | ❌ `load.json` / `tick_.json` あり（`animated_java:global/*` を登録） | AJ 再エクスポートで `animated_java_valk` 側に生成させ、旧タグは削除 |
| AJ アニメ再生 API 呼称 | `animated_java_dino:dino/animations/<a>/tween` | `animated_java_ranposu:ranposu/animations/<a>/tween` | `animated_java:valk_aj/animations/<a>/tween` | `animated_java_valk:valk/animations/<a>/tween` に全置換 |
| 「再生中」判定タグ | `animated_java_dino.dino.animation.<a>.playing` | `animated_java_ranposu.ranposu.animation.<a>.playing` | ❌ `aj.valk_aj.animation.<a>.playing` | `animated_java_valk.valk.animation.<a>.playing` に全置換 |
| `mcfunction` 総数（固有名前空間） | 約 399 | 約 159 | 約 532 | — |

---

## 2. データ登録（`core/register` 相当）

| 項目 | 新形式（dino/ranposu） | 旧 valk | 更新方針 |
| --- | --- | --- | --- |
| ファイル構成 | ✅ `core/register.mcfunction` 1 本（スコア定義 + MonsterData + DefenceData + AttackData） | ❌ `core/init/init_monster_data.mcfunction` + `core/init/init_attack_data.mcfunction` の 2 分割 | `core/register.mcfunction` に統合。`init_*` は削除 |
| 呼び出し | ✅ `load` → `core/register` / `core/summon/summon` からも呼ぶ | `core/summon/summon` が `core/init/init_monster_data` を直接呼ぶ。`load.mcfunction` 自体が存在しない | `load.mcfunction` を新設 |
| MonsterData スキーマ | ✅ §4.1 準拠（`Name`, `UpperName`, `<Part>PartDamage` 群） | だいたい準拠（valk は部位が多い: Head/Body/Tail/ArmR/ArmL/LegR/LegL/WingR/WingL） | 現行フィールドを流用可。`Name:"valk"` / `UpperName:"Valk"` / `Uid:1004` はそのまま |
| DefenceData | ✅ `Defences:[[切,打,弾,火,水,雷,氷,龍],…]` | ✅ 同形式（10 行: 頭/胴/尻尾/右腕/左腕/右脚/左脚/右翼/左翼/胸(吸引中)） | そのまま流用可 |
| AttackData スキーマ | ✅ **新スキーマ**: `Name, AttackPart, VectorType, DamageValue(f), ObjectDamageValue, GuardValue, ElementType, ElementMultiply, KnockbackStrength, IsLaunch, LaunchAngle, IsFixedDamage, IsDisableDefence, IsDisableDamageInterval, IsDisableGuts, Effect{}` | ❌ **旧スキーマ**: `Name, DamageValue(f), GuardValue, ElementType, ElementMultiply, Knockback, IsLaunch, LaunchType, IsDisableDefence, IsDisableDamageInterval, IsDisableGuts`（`AttackPart` / `VectorType` / `ObjectDamageValue` / `KnockbackStrength` / `LaunchAngle` 欠落、`Knockback`→`KnockbackStrength`、`LaunchType`→`LaunchAngle` 相当） | 全 17 技を新スキーマに書き直す。特に `AttackPart` は `event/<anim>/main` の `start_attack.m` 分岐に必須 |

---

## 3. 召喚 / 初期化フロー

| ステップ | 新形式 | 旧 valk | 更新方針 |
| --- | --- | --- | --- |
| `core/summon/summon` | ✅ `core/register` → `mhdp_monsters:core/super/summon/` → `TargetMonsterData` セット → `animated_java_<name>:<name>/summon` → `Mns.Temp.IsIdleAnimation` → Root as `core/init/` | ⚠️ Uid スコア化を自前 → `core/init/init_monster_data` → `animated_java:valk_aj/summon` → Root as `core/summon/summon_init` | `super/summon/` に委譲し `core/init/` へ集約 |
| 初期化関数名 | ✅ `core/init/`（ファイル名 `.mcfunction`） | ❌ `core/summon/summon_init` + `core/summon/summon_init_unique_data` の 2 段 | `core/init/.mcfunction` 1 本に統合（固有部分はその中に） |
| 共通ステータス計算 | ✅ `mhdp_monsters:core/super/init/` | ⚠️ `mhdp_monsters:core/util/summon/init_common_data`（旧共通関数。内容はほぼ同じだが当たり判定初期化が `mob_manager:init/` を呼ぶ） | `core/super/init/` に切り替え（当たり判定は `core/super/init/init_hitbox`） |
| ボスバー | ✅ `bossbar add mhdp_monster:<name> {"text":""}` + `update_bossbar.m {Monster,State:"relax"}` で名前生成 | ⚠️ `bossbar add mhdp_monster:valk [{"text":"天彗龍"},{"text":"",...}]` を直書き（`summon_init_unique_data` 内） | `update_bossbar.m` 方式へ。怒り時のバー名も `start_anger.m` / `end_anger.m` に任せる |
| `core/summon/intrusion` | ⚠️ 存在するが中身は壊れたコピペ（存在しない `core/summon/summon_init` 参照） | ❌ ranposu からの完全コピペ（`animated_java_ranposu` / `Mns.Root.Ranposu` を参照） | valk で乱入を使うなら `summon` と同じ流れで実装。使わないならファイルだけ置く |

---

## 4. tick アーキテクチャ

| 項目 | 新形式 | 旧 valk | 更新方針 |
| --- | --- | --- | --- |
| `core/tick/tick` | ✅ `core/tick/main` を呼ぶ + 怒り速度ループ | ⚠️ `core/tick/tick_main` を呼ぶ + 怒り速度ループ + **弾処理ループ**（`Mns.Shot.Valk` の item_display / text_display に `core/tick/shot/tick`） | `main` に改名。**弾処理ループは削除**（弾は共通 `assets:object/` システムへ移行。spec §3.18）。→ 実装済み: tick から弾ループ削除・TODO 化 |
| tick 本体 | ✅ `core/tick/main`: AJ on_tick → `super/tick/pre_tick` → `super/tick/in_tick` → **Phase 別に自パックの `on_relax/on_caution/on_battle/tick`** → `animation/event/main` → `super/tick/post_tick` | ❌ `core/tick/tick_main`: `animated_java:valk_aj/root/on_tick` → **`mhdp_monsters:core/util/tick/tick`（旧モノリシック共通処理）** → `animation/event/main` → `effect_anger` | `core/tick/main` を新形式の骨格に置換。フェーズ管理を自パックへ移す |
| 探索 / 発見 | ✅ 自パックの `on_relax/update_caution`（警戒度 `Mns.<Upper>.Caution`）→ `on_caution/update_search`（発見度 `Mns.<Upper>.Search`）→ `on_battle` の 3 段階、`Mns.General.Phase` 0/1/2 | ❌ `mhdp_monsters:core/util/tick/tick` 内で `Mns.General.SearchTimer` を距離別に加算するだけ。`Mns.State.IsBattle` の 2 値管理 | 3 段階フェーズ + `Caution`/`Search` スコアへ移行。`on_relax/on_caution/on_battle/{tick,start,update_*}` を新設 |
| まばたき | ✅ `super/tick/in_tick` が担当 | ⚠️ `mhdp_monsters:core/util/tick/tick` が担当（同等） | `in_tick` 方式に自動移行 |
| 討伐後消滅 | ✅ `super/tick/in_tick`（600 tick） | ⚠️ 旧共通 tick（600 tick、同等） | 自動移行 |
| 埋まり対策 | ✅ `super/tick/post_tick`（`adjust_position` / `back_to_rear.m`） | ⚠️ 旧共通 tick（`back_to_field`） | 自動移行 |

---

## 5. 被ダメージ処理（`core/damage/damage`）

| 項目 | 新形式 | 旧 valk | 更新方針 |
| --- | --- | --- | --- |
| 非戦闘時の被弾 | ✅ `core/tick/on_battle/start_ambush`（攻撃者へ Search/Hate、"!" 表示、`reaction/ambush`） | ❌ `Mns.General.SearchTimer` を 3000 に + `core/tick/animation/change/main` を直接呼ぶ | `on_battle/start_ambush` を新設し呼ぶ |
| 共通ステータス減算 | ✅ `mhdp_monsters:core/util/damage/damage_common_data` | ✅ 同じ関数を使用 | そのまま |
| 部位ダメージ | ✅ 部位 ID → `Mns.<Upper>.<Part>.Damage -=` → `..0` で `Mns.Temp.Damage.<Part>` | ✅ 同じ構造（part id 0–9） | そのまま流用可 |
| 怯み優先度 | ✅ 麻痺 → スタン → 相殺 → 各部位 → 怒り の順で `Mns.Temp.IsDamaged` により 1 つだけ | ✅ ほぼ同じ（valk は胴吸引中 `body_sp` が相殺の前） | そのまま流用可 |
| ボスバー更新位置 | ✅ 部位減算の直後 | ⚠️ 末尾（順序が違うだけ、実害小） | 位置を揃える（任意） |
| reaction 共通処理 | ✅ 各 `reaction/*` 冒頭で `mhdp_monsters:core/util/damage/on_reaction_start`、耐性リセット、末尾 `Mns.Temp.IsDamaged` | ⚠️ valk は `reaction/general`（末尾共通処理: アニメ判定タグ掃除・肉質変化・演出リセット）を独自に持つ。`on_reaction_start` は呼んでいない | `on_reaction_start` を各 reaction に追加。`reaction/general` は valk 固有処理として維持可 |

---

## 6. フェーズ / 状態管理

| 概念 | 新形式 | 旧 valk |
| --- | --- | --- |
| フェーズ変数 | `Mns.General.Phase`（0 未発見 / 1 警戒 / 2 戦闘） | `Mns.State.IsBattle` タグ + `Mns.General.SearchTimer` |
| 未発見→警戒 | `Mns.<Upper>.Caution >= 1000`（プレイヤーごと、`on_relax/update_caution`） | なし（警戒フェーズ自体がない） |
| 警戒→戦闘 | `Mns.<Upper>.Search >= 1000`（`on_caution/update_search`） | `SearchTimer >= 2000` → `Mns.Temp.IsFirstContact` → `Mns.State.IsBattle` |
| 戦闘→警戒/未発見 | 全プレイヤーの Search / Hate が 0 で `on_caution/start` / `on_relax/start` | 実質戻らない |
| ターゲット | `Mns.Target.<Upper>` を `check_target` / `update_target` / ヘイト最大で決定 | `Mns.Target.Valk` を `animation/change/update_target` で決定（構造は近い） |
| ヘイト | プレイヤースコア `Mns.<Upper>.Hate`、距離別加算、別エリア減衰 | valk も `Mns.Valk.Hate` 系はあるが、更新は `animation/change` 側 |

valk 固有の内部フェーズ（`Mns.Valk.PhaseCount` / `PhaseCount.Comet` / `PhaseCount.Move` / `PhaseCount.Beam` による大技解禁、彗龍形態 ⇔ 龍気形態の変形）は**戦闘フェーズ内の行動選択ロジックとして維持**する。ここでいうフェーズ移行は「未発見/警戒/戦闘」の 3 段階の話。

---

## 7. アニメーション選択・イベント

| 項目 | 新形式（dino/ranposu） | 旧 valk | 更新方針 |
| --- | --- | --- | --- |
| 行動選択ハブ | ✅ `core/tick/animation/change/main` → Phase 別 `change/on_relax\|on_caution\|on_battle/main` → `change/play/main` | ⚠️ `core/tick/animation/change/main` → `change/random/main`（戦闘のみ想定、非戦闘は `lance_search` 固定 return）→ `change/play/main` | Phase 別 `change/on_relax\|on_caution\|on_battle/main` を新設。`random/*` は `on_battle/main` 配下へ移設 |
| 行動選択トリガ | 各アニメの `event/<anim>/end` → `change/main` | 同じ | そのまま |
| 距離分岐 | `change/on_battle/{first,near,middle,far}` に `return run` で委譲 | `change/random/{first,lance_near,lance_middle,lance_far,shoot_near,shoot_middle}` | 命名を `on_battle/` 配下へ寄せる（機能は流用可） |
| 2 形態対応 | なし（単一形態） | あり（`Mns.Valk.State.IsShoot` で 彗龍 `lance_*` / 龍気 `shoot_*` を切替） | **valk 固有機能として維持**。`change/play/main` の `lance_*` / `shoot_*` 分岐はそのまま |
| `event/main` | ✅ 全アニメ分の `animated_java_<name>.<name>.animation.<a>.playing` 判定行 | ⚠️ `aj.valk_aj.animation.<a>.playing` 判定行 | タグ名を全置換（機能同じ） |
| `event/<anim>/main` | ✅ `aj.<anim>.frame` で効果音・移動・`start_attack.m` / `<anim>/attack` / `end_attack`・終端 `end` | ✅ 同じ構造（`aj.<anim>.frame`） | そのまま流用可（AJ 名前空間置換のみ） |
| 攻撃実行 | ✅ `mhdp_monsters:core/util/tick/event/apply_attack.m {Uid,AttackName,Player_*,Entity_*}` | ✅ 同じ関数（valk も使用） | そのまま |
| 攻撃開始分岐 | ✅ `start_attack.m` → `mhdp_monsters:core/switch/start_attack` → `on_battle/attack/<AttackPart>` | ❌ valk の AttackData に `AttackPart` が無いため `start_attack.m` 経由の分岐が機能しない可能性。`on_battle/attack/*` も未整備 | AttackData に `AttackPart` を付与し、`on_battle/attack/<part>` を用意（§spec 3.13） |
| 軸合わせ | ✅ `change/play/turn`（正面なら即実行、左右判定で `turn_r/l`） | ✅ `change/play/turn`（`store result` で 99 なら即実行） | 流用可 |

---

## 8. 部位構成・固有システム

| 項目 | dino | ranposu | valk |
| --- | --- | --- | --- |
| 部位（DefenceData 行 / 部位破壊） | 頭 / 胴 / 尻尾 / 右脚 / 左脚（+ 頭赤熱化 / 尻尾赤熱化 / 尻尾錆び の肉質変化行）。破壊: 頭・尻尾（切断） | 頭 / 胴 のみ。破壊: 頭 | 頭 / 胴 / 尻尾 / 右腕 / 左腕 / 右脚 / 左脚 / 右翼 / 左翼 / 胸(吸引中)。破壊: 頭・尻尾・両翼 |
| 固有状態 | 尻尾赤熱化 / 尻尾錆び / 喉赤熱化（`core/util/phase/*`、`core/util/models/*` で当たり判定 PartId とモデルを切替） | 大ダウン（`reaction/sp`: 頭 or 胴を規定回数怯ませると発動） | 彗龍/龍気の変形、龍気吸引（`lance_charge`）、彗星（`comet_phase_1..5`）、龍閃ビーム（`lance_biim_1/2`）、怒り終了カウント |
| 弾システム | **共通 `assets:object/` システム**（monster 側は `api:object/summon.m {ObjectId:N}` を呼ぶだけ。spec §3.18） | ❌ monster datapack 内に `core/tick/shot/`（19 ファイル）。`Mns.Shot.Valk` エンティティを `core/tick/tick` のループで毎 tick 更新。beam / bomb / comet / comet_burst / comet_jet / comet_star / red_flash / thunder / tail(切断尻尾) の VFX・当たり判定 | **`assets:object/1004x.valk_*`（9個, 10040-10048）へ移行**。旧 `core/tick/shot/*` のロジックを各 object の `summon/init/tick` へ移植、`Mns.Shot.Valk.*` タグ運用は廃止。呼び出しは event 側で `api:object/summon.m`。**切断尻尾は valk 固有ではなく全モンスター共通 object として別途作成**（valk 対象外）。詳細計画は valk `migration_progress.md` Stage 6-S |
| `_index.d` のアニメタグ | `Anim.*` を宣言 | `Anim.Idle`, `Anim.Turn.R/L`, `Anim.Bite` … を宣言 | 弾タグ `Mns.Shot.Valk(.Tail)`、攻撃位置マーカー `Mns.MovePos.Valk` / `Mns.ShotPos.Valk`、遷移タグ `Mns.Temp.Valk.MoveTo*` を宣言 |
| 怒り演出 | `core/tick/effect_anger`（マクロ、コメントアウト気味） | 同左 | `core/tick/effect_anger` + `m.effect_anger_head` / `m.effect_anger_wing`（実使用） |

**valk 固有で新形式移行時も残すもの**: 2 形態（`Mns.Valk.State.IsShoot`）、彗星/龍閃/龍気吸引の各アニメイベント、`core/damage/reaction/general` の末尾共通処理、`core/util/models/model_interrupt`。
（弾システムは monster 固有では**なく** `assets:object/` へ移す。「残す」対象から除外）
これらは「共通化できない valk 独自ロジック」なのでそのまま維持し、**骨格（メタ情報・register・summon/init・tick の外枠・フェーズ管理・AJ 名前空間・タグ命名）だけを新形式に合わせる**。

---

## 9. 共通 util 依存の対応表

| 旧 valk が呼んでいる関数 | 新形式での対応 |
| --- | --- |
| `mhdp_monsters:core/util/summon/init_common_data` | `mhdp_monsters:core/super/init/` |
| `mhdp_monsters:core/util/tick/tick`（モノリシック） | `mhdp_monsters:core/super/tick/pre_tick` + `in_tick` + `post_tick` に分割呼び出し、フェーズ処理は自パックの `on_relax/on_caution/on_battle/tick` |
| `mob_manager:init/`（当たり判定） | `mhdp_monsters:core/super/init/init_hitbox`（`super/init/` 内で自動） |
| `animated_java:valk_aj/...` | `animated_java_valk:valk/...` |
| `aj.valk_aj.animation.<a>.playing` | `animated_java_valk.valk.animation.<a>.playing` |
| ボスバー名直書き | `mhdp_monsters:core/util/tick/update_bossbar.m` / `start_anger.m` / `end_anger.m` |

そのまま使える共通関数（新旧共通）: `damage_common_data`, `reaction_poison`, `reaction_bomb`, `reaction_flying`, `death_flying`, `remove_hitbox`, `remove_tags`, `check_hp_half`, `apply_attack.m`, `start_attack.m`, `end_attack`, `get_attack_data.m`, `check_animation_tag`, `remove_animation_tag`, `fetch_player/check_player_situation.m`, `fetch_player/check_max_hate.m`, `move/check_landing`, `enable_damage.m`, `update_bossbar.m`, `start_anger.m`, `end_anger.m`, `skip`。

---

## 10. 更新作業の要約

1. **メタ**: `pack.mcmeta` を 107.1 化、`description` 修正。
2. **AJ**: blueprint を `animated_java_valk` へ再エクスポート。旧 `animated_java`/`valk_aj` 参照・`data/minecraft` タグを撤去。全ファイルで名前空間・`.playing` タグ・`aj.<anim>.frame` の参照名を置換。
3. **register**: `init_monster_data` + `init_attack_data` → `core/register.mcfunction` に統合。AttackData を新スキーマ（`AttackPart` / `VectorType` / `ObjectDamageValue` / `KnockbackStrength` / `LaunchAngle` 追加）へ書き直し。`load.mcfunction` 新設。
4. **summon/init**: `core/summon/summon` を `super/summon/` + `core/init/` 方式へ。`summon_init(_unique_data)` を `core/init/.mcfunction` に統合。`super/init/` に耐性計算を委譲。
5. **tick**: `tick_main` → `core/tick/main`。骨格を「AJ on_tick → super pre/in → Phase 別 tick → event/main → super post」に。旧 `mhdp_monsters:core/util/tick/tick` 依存を外す。
6. **フェーズ**: `Mns.General.Phase` 0/1/2 と `Mns.Valk.Caution` / `Mns.Valk.Search` を導入。`core/tick/on_relax/*` `on_caution/*` `on_battle/*` を新設（ranposu を雛形に）。`core/damage/damage` の非戦闘被弾を `on_battle/start_ambush` へ。
7. **行動選択**: `change/main` を Phase 分岐化。`change/random/*` を `change/on_battle/*` 配下へ移設。`change/play/main` の 2 形態分岐は維持。
8. **attack 分岐**: `core/tick/on_battle/attack/<part>` を用意し、AttackData の `AttackPart` と対応させる。
9. **reaction**: 各 `reaction/*` に `on_reaction_start` を追加。`reaction/general` は固有処理として維持。
10. **util**: valk は `apply_blink` / `end_blink` / `show_bossbar` / `show_toast` / `hide_toast` / `models/*` / `phase/*` を既に持つ（AJ 名前空間の置換は必要）。**不足しているのは `core/util/fetch_player`** — 新形式の定型（同エリアプレイヤーに `Mns.Candidate.Valk` 付与 → ボスバー対象更新 → Phase 2 中は Search 固定 + `check_target`）で新設する。`show_bossbar` は `players @a[tag=Ply.State.MnsTarget]` 方式へ統一。
11. **固有機能維持**: 彗星・龍閃・龍気吸引、変形。骨格のみ差し替え、中身のロジックは温存。
12. **弾システム移行**: 旧 `core/tick/shot/*` を `assets:object/1004x.valk_*` へ移植（spec §3.18）。呼び出し側 event は `api:object/summon.m {ObjectId:N}`。旧 `Mns.Shot.Valk.Vfx.*` の `summon text_display` 直書きも object 化。詳細は valk `migration_progress.md` Stage 6。
