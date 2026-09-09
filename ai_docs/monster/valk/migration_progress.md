# mhdp_monster_valk 新形式移行 進捗トラッカー

`mhdp_monster_valk_bak`（旧形式）→ `mhdp_monster_valk`（新形式）への移行進捗。
セッションをまたぐ再開はこのファイルを起点にする。作業ブランチ: `feature/update_valstrax`。

> **最終保存状態**: Stage 1〜4 完了 + Stage 5-A approve 済み + **Stage 5-C 進行中（13/85 approve済: lance_idle + lance_spear系4 + lance_vertical系6 + lance_upper系2[approve・2026-09-08]）**。ここでコミット可。
> **⚠ Stage 6 タスク**: event 内の `# TODO(Stage6):` VFX/弾演出は、assets オブジェクト作成完了後に `api:object/summon.m {ObjectId:...}` を記載する（ユーザー指示 2026-09-08）。`grep -rn 'TODO(Stage6)' mhdp_monster_valk/` で一覧。
> lance_upper レビュー反映（2026-09-08）: 突き上げダメージは `attack` 内の縦長1ボックス（`Offset_Z:28.5`,`Scale_X/Y:3.4`,`Scale_Z:43`）、演出は `attack_effect`（旧 attack_sub 改名・ダメージなし）を前方 0..50 の11点で呼ぶ。main の attack 呼び出しは `positioned ^±1.2 ^1 ^12 rotated ~±3 ~`。
> lance_vertical レビュー反映（2026-09-07）: お手は start_attack なし / 振り下ろし中判定 `attack_swing`+`hit_swing` 新設 / RedFlash → `particle flash{color}` / 地面ひび割れ → `api:object/summon.m {ObjectId:16}` + `dust_pillar` / 着弾箱 `Scale 5/7/4 Offset_Y2` / 空 dir `197609` 削除。
> ※ユーザーが disk 上で全 vertical の `cuboid_preview.m` をコメントアウト、turn_l/turn_r の軸合わせを `Tick:5/MaxRotation:360`（frame2）+ `Tick:10/360`（frame33）へ調整済み。意図的編集として尊重。
> 5-C レビュー反映済み: (1) 軸合わせは `alignment_start.m`/`alignment` に統一（個別 turn_start ファイル廃止）(2) hit_* は `apply_attack.m` 直前に同一引数の `api:bounding/cuboid_preview.m` を配置 (3) 複数回ヒット技は判定区間ごとに start_attack.m/end_attack で挟む（spin 系は突き@35-42／回転斬り@68-85 の2区間）。
> ※ユーザーが disk 上で hit_* の cuboid_preview をコメントアウト / spin の hit を `apply_attack_with_entitypos.m`（EntityPosSelector:`@n[type=item_display,tag=Mns.Root.Valk]`）へ変更中。意図的な編集として尊重。
> 次の作業は 5-C の残り 80 グループ。再開時は下記「Stage 進捗」→「次に着手」を確認。
> `apply_attack.m` の当たり判定サイズは旧の球状距離判定からの近似値。実機テストで要調整。
> `change/main.mcfunction` はユーザーが disk 上で dino 準拠へ微修正（怒り終了の `!IsAlreadyAnimation` 除去、軸合わせ 99 判定ブロック除去、終了の `IsTurn.Big` 除去）。
> **要確認**: 現状 `change/main` の軸合わせ行は `store result #mhdp_temp_result` が未消費・未リセット、正面時 `play/turn` が `return 99` で早期 return すると `Mns.Temp.IsTurn` が残り play/main も走らず 1tick 何もしない可能性。`play/turn` 側での内部処理化 or 判定復活が要検討（ユーザー編集中）。

## 参照
- 手順書: `ai_docs/monster_datapack_spec.md` / 差分表: `ai_docs/monster_datapack_comparison.md`
- 新形式テンプレ: `mhdp_monster_ranposu`（`mhdp_monster_ranposu_bak` からの同一変換の実例）, `mhdp_monster_dino`
- 共通エンジン: `mhdp_core/data/mhdp_monsters/`

## 前提・確定事項
- **AJ 再エクスポート（`animated_java_valk`）はユーザーが実施済み（2026-09-02）**。`mhdp_monster_valk/data/animated_java_valk/` 配置済み。
- **`animated_java*` フォルダは Read/Grep 禁止**（巨大・コンテキスト圧迫。ユーザー指示）。frame 番号は `mhdp_monster_valk_bak` の event ファイルから流用。ボーン/ロケータ名の確認はユーザーに質問。
- コードは `animated_java_valk:valk/...` 前提。アニメ名は旧 `valk_aj/animations/` と同一前提。
- `mhdp_core` 側は Uid 1004 配線済み → 変更不要。
- **git commit はユーザーが手動**。Claude は commit すべきタイミングを通知するのみ、勝手に commit しない。
- バッチ単位で作業し、各バッチ終了時にこのトラッカーを更新する。
- `.mcfunction` のコマンドトークン間スペースは必ず1つ（CLAUDE.md 参照）。
- AJ ロケータ参照は `at_locator`/`as_locator`（旧 `on passengers ... data.locators` は不可。CLAUDE.md 参照）。
- 弾システムは `mhdp_core:assets` 側 + `api:object/summon.m {ObjectId:...}`（dino 方式）。**Stage 6 で保留対応**。旧 `core/tick/shot/*` は移植しない。
- **軸合わせ処理は dino 準拠**（2026-09-05 レビューで既存4グループを修正済み。以降の全グループに適用）:
  - 旧 `turn_start`/`turn_start_adjust`（個別ファイル）→ 廃止。`function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:YY,MaxRotation:ZZZ}` を main.mcfunction に直接インライン。YY は旧ファイル内の `#mhdp_temp_rotate_tick` 設定値をそのまま流用（例: turn_start=10, turn_start_adjust=7）。ZZZ は基本 180。
  - 旧 `function mhdp_monsters:core/util/other/turn_to_target_rotate`（frame範囲呼び出し）→ `execute ... at @s run function mhdp_monsters:core/util/tick/event/alignment`（`at @s` 必須、dino 実例準拠）。

## AttackData（register 済み・23 エントリ）
- `Bite`=head / `Vertical.Hand`,`Upper`,`DashAttack`,`Tackle`,`JetTackle`=body
- `Beam`,`Comet`,`Shot`,`Bomb.Side`,`Bomb.Forward`=none
- 翼槍6技 ×左右 = `wing_right`/`wing_left`: `Spear.{Right,Left}`,`SpearSpin.{Right,Left}`,`Vertical.{Right,Left}`,`VerticalS.{Right,Left}`,`Sweep.{Right,Left}`,`Sweep.Anger.{Right,Left}`
- LaunchType→LaunchAngle: LT1→60, LT2→35, 非Launch→0。VectorType 全 "Normal"。ObjectDamageValue は全エントリ `#TODO` 付き（ユーザー手動調整）。

## 部位
head0 / body1 / tail2 / armR3 / armL4 / legR5 / legL6 / wingR7 / wingL8 / bodySp9（吸引中の胸）
DefenceData 10 行。HitBox タグ/PartId は AJ 生成 locator が付与。破壊: 頭・尻尾(切断)・両翼。

---

## Stage 進捗

### Stage 1 — メタ/register/load/_index.d  ✅ 完了（レビュー反映済み）
- `pack.mcmeta`（107.1 / "For Monster Valstrax"）
- `data/mhdp_monster_valk/function/load.mcfunction`
- `_index.d.mcfunction`
- `core/register.mcfunction`（objectives + MonsterData + DefenceData + AttackData 新スキーマ）
- NameId は `monster.valk.name`（ShowName=`monster.valstrax.name`）→ resource pack に `monster.valk.name` キー要追加

### Stage 2 — summon/init/remove/death  ✅ 完了（レビュー反映済み）
- `core/summon/summon.mcfunction` / `core/summon/intrusion.mcfunction`（summon と同一フロー）
- `core/init/.mcfunction`（空stem。super/init/ 委譲 + 10部位耐久 + 固有スコア0 + lance_idle）
- `core/remove/remove.mcfunction`（弾 kill は #TODO 化。ユーザー修正待ち）
- `core/death/death.mcfunction`

### Stage 3 — tick骨格 + フェーズ  ✅ 完了（レビュー反映済み）
- `core/tick/tick.mcfunction`（弾ループ削除済み）
- `core/tick/main.mcfunction`（dino 形式）
- `core/tick/effect_anger.mcfunction` + `effect_anger_head.mcfunction` + `effect_anger_wing.mcfunction`（at_locator 記法）
- `core/tick/on_relax/{tick,start,update_caution}.mcfunction`
- `core/tick/on_caution/{tick,start,update_search}.mcfunction`
- `core/tick/on_battle/{tick,start,start_ambush,check_target,update_target,update_hate}.mcfunction`
- `core/tick/on_battle/attack/{head,body,tail,wing_right,wing_left,none,end}.mcfunction`
- TODO: update_caution/update_search の FOV/距離は ranposu 値流用（valk 用に調整余地）

### Stage 4 — damage / reaction / break  ✅ 完了（レビュー反映済み・break/ フォルダ化対応）
- [x] `core/damage/damage.mcfunction`（Phase!=2→start_ambush、部位ID 0-9→Temp.Damage、怯み優先度、SearchTimer 撤去、`.playing` タグ新形式化）
- [x] `reaction/anger.mcfunction`（`start_anger.m {Name:"valk"}` + `on_reaction_start`）/ `anger_end.mcfunction`（`end_anger.m` + EndAngerCount/Anim.Charge）
- [x] `reaction/counter.mcfunction` / `stun.mcfunction` / `paralysis.mcfunction`
- [x] `reaction/body_sp.mcfunction`（胸/吸引中）
- [x] `reaction/{head,body,tail,arm_r,arm_l,leg_r,leg_l,wing_r,wing_l}.mcfunction`
- [x] **`break/` フォルダ**（dino 準拠。レビュー反映）: `break/{head,arm_r,arm_l,wing_r,wing_l,tail_cut}.mcfunction`。`reaction/*` から `core/damage/break/*` を呼ぶ。plain `tail`（非切断）は valk では不要のため無し（尻尾は切断のみ破壊）。
- [x] `reaction/flying.mcfunction`（valk 固有アニメ名 lance_damage_flying でインライン。共通 reaction_flying は damage_flying を要求するため未使用）
- [x] `reaction/general.mcfunction`（valk 固有末尾共通処理・維持。Body0→Body 誤記修正）
- [x] **`reaction/ambush.mcfunction`（新設）**
- 各 reaction 冒頭に `mhdp_monsters:core/util/damage/on_reaction_start` 追加。末尾は valk 固有 `reaction/general`。
- **省略**: `reaction/sp.mcfunction`（旧は ranposu コピペ・呼び出し無し）、`reaction/flying_tail.mcfunction`（旧は reus コピペ・呼び出し無し）、`reaction/macro/m.summon_tail.mcfunction`（尻尾切断エンティティ設置 = Stage 6 弾システムで対応、tail_break_cut に TODO）
- 部位破壊処理は `break/` フォルダに集約（dino 準拠）。`reaction/<part>` が閾値到達時に `break/<part>` を呼ぶ。
- **バグ修正**: 旧 stun の `aj.valk_aj.animation.lance_down_right.playing`（存在しないアニメ名）→ `lance_down_r`。旧 arm_l/leg_l/leg_r の IsDown 判定が `Mns.Valk.ArmR.Damage.Count` 固定だったのを各部位の Count に修正。
- **要確認**: 旧コードは腕 staggering 初回で `arm_r_break`/`arm_l_break` を無条件発動（腕も部位破壊扱い）。比較表の破壊部位リスト（頭/尻尾/両翼）と食い違うが旧挙動を踏襲。
- **_index.d 追加タグ**: `Mns.Valk.State.Attack.{Head,Wing.R,Wing.L}`, `Mns.Temp.Right`, `Mns.Valk.Temp.Tail.Break`, `Mns.Break.Arm.{R,L}`
- **AJ 再エクスポート要件**: 墜落死アニメは `death_flying`（valk OK）。飛行怯みは valk では `lance_damage_flying` のまま使用（共通関数を使う場合は blueprint で `damage_flying` にリネーム要）。

### Stage 5 — animation change / event（メイン作業・バッチ処理）  ⬜ 未着手

#### 5-A: change/*（行動選択）  ✅ 完了（approve 済み・2026-09-01）
- [x] `change/main.mcfunction`（Phase 分岐化。コメント記法を dino 厳密準拠に修正。ユーザーが disk 上で更に微修正）
- [x] `change/on_relax/main.mcfunction`（**新設・要方向性確認**: 現状は待機ループのみ、Anim 付与なし。TODO コメント付き）
- [x] `change/on_caution/main.mcfunction`（新設: `Anim.Search` → play/main で `lance_search` 再生）
- [x] `change/on_battle/main.mcfunction`（旧 `change/main` 戦闘部 + 旧 `random/main` を統合。PhaseCount/クールタイム/2形態/大技解禁は温存）
- [x] `change/on_battle/{first,change_phase,move,turn}.mcfunction`
- [x] `change/on_battle/{lance_near,lance_middle,lance_far,shoot_near,shoot_middle}.mcfunction`（**抽選は dino/ranposu 厳密準拠**: `check_player_situation.m` → 基礎重み → 状態別 merge → `decide_animation.m {Monster:"valk",State}` → `remove_tag` → action_id 分岐 → `on_battle/turn` → reset）
- [x] `change/on_battle/macro/m.{lance_near,lance_middle,lance_far,shoot_near,shoot_middle,move}.mcfunction`（旧 random/macro/* + `return 1`）
- [x] `change/play/main.mcfunction`（AJ 名前空間置換 + `Anim.Search` 行追加。2形態分岐維持）
- [x] `change/play/{beam,bomb_side,change_phase,dashattack_move,jet_tackle,sault_move,shoot,spear,spear_to_spin,spear_to_spin_move,sweep,turn,vertical,vertical_s,vertical_turn}.mcfunction`（AJ 名前空間置換のみ）
- [x] `change/get_turn.mcfunction` → **省略**（旧は ranposu コピペで呼び出し無し。軸合わせ判定は `on_battle/turn` に集約）
- [ ] `change/interrupt.mcfunction` → Stage 6 の `core/debug/interrupt` へ

**5-A の判断/注意**:
- dino/ranposu の `check_player_situation.m {Tag:"Mns.<Upper>.Target"}` は誤記（実タグは `Mns.Target.<Upper>`）で状態別重み上書きが死んでいる。valk では **正しい `Mns.Target.Valk`** を使用し、旧 valk が持っていた正面/背面/側面の重み調整を機能させた。厳密なコピーを望むなら要指示。
- 側面判定は `!IsForward,!IsBack`（dino near と同じ。middle/far の `IsForward,IsBack` 併記は dino のバグなので踏襲しない）。
- `ActCount.Idle` 加算は旧同様 `play/main` に残置（dino は on_battle/main。二重加算回避のため on_battle/main では加算しない）。威嚇閾値は旧 valk の 18。
- `play/spear_to_spin` / `play/vertical_turn` は現状どの選択からも呼ばれない（旧同様。debug/interrupt 用に残置）。

#### 5-B: event/main.mcfunction（ディスパッチャ）  🔶 進行中 (13/85)
- [x] lance_idle / lance_spear系4 / lance_vertical系6 / lance_upper系2 の `.playing` 判定行を追加
- [ ] 残りグループ分（グループ作成に合わせて追記）

#### 5-C: event/<group>/*（85 グループ）  🔶 13/85（lance_upper系2 は未レビュー）

**lance_upper 系（翼槍突き上げ）で追加した扱い**（2026-09-07）:
- 前方一直線の当たり判定（2026-09-08 ユーザー再設計・l/r 反映済み）: ダメージは `attack` 内の `apply_attack.m {Upper}` **1個の縦長ボックス**（`Offset_Z:28.5`, `Scale_X/Y:3.4`, `Scale_Z:43.0`。`cuboid_preview` は `Scale_Z:45.0`）。演出は別途 `attack` から `positioned ^ ^ ^N`（N=0..50, step5, 11点）で `attack_effect.mcfunction` を呼ぶ（dust赤/explosion のみ。ダメージなし）。Bomb/RedFlash の `summon text_display` はコメントアウト + `# TODO(Stage6)`。main の attack 呼び出しは `positioned ^±1.2 ^1 ^12 rotated ~±3 ~`。
- **お手** `attack_hand`（`Vertical.Hand`、`^±1.5 ^1 ^8`、Scale 1.8）は start_attack を挟まない（相殺不可）。
- 突き上げ本体（2026-09-08 レビュー反映）: **start_attack / end_attack を挟まない**（相殺不可）。`attack@56`(`positioned ^±1.2 ^1 ^12 rotated ~±3 ~`) のみ。`cuboid_preview.m` は全 attack 系（attack / attack_hand）でコメントアウト。※`Mns.Valk.State.Attack.Wing.L/R` タグ（53-59、"相殺アニメ分岐用"）は据え置き（ユーザーは start_attack/end_attack のみ指定）。完全 相殺不可なら要削除確認。
- **精密軸合わせ**: 旧 `core/util/other/turn_to_target_accurate`（frame 37..44、`Temp.Rotate.Target` タグ後に呼ぶ）→ 新 `core/util/tick/event/turn_to_target_accurate`（`at @s` 付き。ranposu step_jump_left が実例）。
- 溜め/軌跡パーティクル: `m.particle_charge`(large_smoke) / `m.particle`(cloud) → `at_locator {name:"pos_wing_*_3"}` + `particle_charge.mcfunction` / `particle.mcfunction` 新設。
- `end.mcfunction` は `change/main` ではなく直接 `animated_java_valk:valk/animations/lance_idle_short/tween`（旧踏襲。spin 系と同様）。
- **バグ修正**: 旧 `lance_upper_l` のモデル演出が `ignite_start_right`/`ignite_end_right`（右）を誤参照（左翼技なのに）→ `ignite_start_left`/`ignite_end_left` に修正（spin_r/turn_r と同種）。
- **未使用で移植せず**: `turn_start_1`（Tick5、旧 main から参照なし・dead code）。`turn_start_0` は alignment_start.m インライン化。
- 依存: `core/util/models/ignite_start_left|right`（Stage 6 未実装・先行配線）。

**lance_spear 系（2連突き・翼槍回転斬り）で確立したパターン**（以降のグループもこれに倣う）: 

**lance_spear 系（2連突き・翼槍回転斬り）で確立したパターン**（以降のグループもこれに倣う）:
- 攻撃判定: 旧の `on passengers ... data.locators.pos_wing_*_N` ループ → `animated_java_valk:valk/at_locator {name:"pos_wing_*_N",command:"function .../hit_*"}` を翼の可動域点数ぶん呼ぶ。`hit_*.mcfunction` 側で `apply_attack.m {Uid:1004,AttackName:"...",Player_*,Entity_*}` を実行（旧 `distance=..3.5` 球状判定 → Scale 3.0〜3.5 の箱型で近似。**要現地調整**）
- 旧の `mhdp_core:player/damage/entity_to_*`（廃止APIかつ `Mns.Target.Dino` 誤参照あり）は完全撤去
- `start_attack.m`/`end_attack` を旧来の「怯みアニメ分岐用 `Mns.Valk.State.Attack.Wing.*` タグ」と同じフレーム窓で追加（`on_battle/attack/wing_left|wing_right` を有効化）。**複数回ヒットする技（回転斬り系の突き→回転斬り等）は、攻撃判定が出ている区間ごとに start_attack.m / end_attack で挟む**（1回目と2回目の間に end_attack を入れ、判定が無い間は start_attack を有効にしない。2026-09-05 レビュー反映）。start_attack.m の参照 AttackName は各ヒットの技名に合わせる（突き=`Spear.*`、回転斬り=`SpearSpin.*`）
- AttackData 参照名は Stage1 で分割した `Spear.Left/Right`・`SpearSpin.Left/Right`
- 装飾パーティクル/リング演出は `m.` プレフィックスを外し非マクロ化、`at_locator` から素の `particle` 文を呼ぶ形に統一
- 各 `hit_*.mcfunction` の `apply_attack.m` 呼び出し直前に、**同一引数**で `function api:bounding/cuboid_preview.m {...}`（デバッグ用当たり判定プレビュー）を追加する（2026-09-05 レビュー反映。既存8ファイル全て対応済み。以降の全 hit_* ファイルにも適用）
- 接地は `check_landing`
- **バグ修正**: 旧 `lance_spear_to_spin_r/main` の frame 33-38/35-37 の演出が `pos_wing_l_0`/`pos_wing_l_2`（左翼）を誤参照（右回転技なのに左翼座標）→ `pos_wing_r_0`/`pos_wing_r_2` に修正
- **依存**: `core/util/models/ignite_start_left|right`, `ignite_end_left|right`（Stage 6 未着手。呼び出しは先行配線済み、Stage 6 で実体作成）
- **軸合わせ**: 個別 `turn_start`/`turn_start_adjust` ファイルは廃止し `alignment_start.m`/`alignment` に置換（上記「前提・確定事項」参照）。4グループとも修正済み・不要ファイル削除済み。

**lance_vertical 系（翼槍叩きつけ、6グループ）で追加した扱い**:
- `attack.mcfunction`: 単発 AoE（旧 `distance=..4.0`）→ `main` から `execute ... positioned ^X ^1 ^7 run function .../attack`、`attack` 内で `cuboid_preview.m` + `apply_attack.m`（Player/Entity_Scale 4.0、Offset 0）+ explosion/mace sound/`crack_ground/start`×2/`particle_ring`。旧 `mhdp_core:player/damage/entity_to_*` は撤去。
- `lance_vertical_l/r` のみ「お手」当たり判定 `attack_hand.mcfunction`（`Vertical.Hand`、`positioned ^±1.5 ^1 ^8`、Scale 1.8）を持つ。l_to_r/r_to_l/turn_* は旧に `attack_hand` ファイルはあるが未使用（dead code）なので**移植しない**。
  - **レビュー反映（2026-09-07）**: お手には `start_attack.m`/`end_attack` を**挟まない**。`start_attack` は相殺判定の有効化用で、お手は相殺不可にするため。`attack_hand`（=`apply_attack.m` 単発、データ自己読込）だけ呼ぶ。
- **振り下ろし中の当たり判定** `attack_swing.mcfunction` + `hit_swing.mcfunction` を全6グループに新設（レビュー反映）。`attack_swing` は `at_locator {name:"pos_wing_*_3",...}` で `hit_swing` を呼び、`hit_swing` が `cuboid_preview.m` + `apply_attack.m`（Scale 3.0、翼爪先端 pos_wing_*_3 基準）。着弾AoE(`attack`)より一回り小さい。
  - フレーム窓（2026-09-07 ユーザー修正・全6グループ反映済み）: l/r/turn_* は `start_attack@42` → `attack_swing 42..49` → `attack(着弾)@48` → `particle_ring@52` → `end_attack@52`。連携(l_to_r/r_to_l)は `start_attack@14` → `attack_swing 14..21` → `attack@20` → `end_attack@24`。
- **着弾 `attack.mcfunction` の箱**（2026-09-07 ユーザー複数回微調整・全6グループ反映済み）: `Offset_Y:2.0`, `Scale_X:5.0`, `Scale_Y:7.0`, `Scale_Z:4.0`（縦長・横広め）。X オフセットは 0.0。`_l` 系は main の `positioned` を `^1.2`（`_r` 系は `^-1.2`）に保つこと（箱自体は X 対称なので反転不要、`positioned` の符号のみ左右で異なる）。
- **地面のひび割れ演出**（2026-09-07 レビュー・全6グループ反映済み）: 旧 `crack_ground/start`（マーカー方向 `facing entity @e[tag=Mk.Field.Back] feet`）→ dino 準拠の `execute positioned ^±1 ^ ^ rotated ~ 0 run function api:object/summon.m {ObjectId:16}`（`0016.ground_crack`、接地はオブジェクト側）。加えて着弾演出に `particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^1.5 ...` を2行追加（ユーザー微調整反映）。CLAUDE.md にルール追記済み。以降の全アニメに適用。
- AttackName は発動翼で選択: `Vertical.Left`/`Vertical.Right`（振り下ろし中・着弾・お手以外で共通。`VerticalS.*` は shoot 形態用なので未使用）。`Vertical.Hand`=body。
- 翼の軌跡パーティクル: 旧 `on passengers ... m.particle ... data.locators.pos_wing_*_3` → `at_locator {name:"pos_wing_*_3",command:"function .../particle"}`。各グループに `particle.mcfunction`（dust赤+cloud）新設。
- 龍閃 赤フラッシュ VFX（旧 `summon text_display ... Mns.Shot.Valk.Vfx.RedFlash`）→ **`particle flash{color:[1.000,0.200,0.200,1.00]} ~ ~1 ~ 3 3 3 0 20 force @a[distance=..48]`** に置換（レビュー反映）。l(f38,`^-2 ^1 ^-6`)/r(f38,`^2 ^1 ^-6`)/l_to_r(f11,`^2 ^1 ^-6`)/r_to_l(f11,`^-2 ^1 ^-6`)。turn_l/turn_r には旧に該当箇所なし。**※ flash 置換は vertical 系のみ。今後の他アニメは置換せずユーザー判断を待つこと。**
- **バグ修正**: 旧 `lance_vertical_turn_r`（右振りむき）が左翼の値を誤参照（`pos_wing_l_3`、`positioned ^1.2`）→ 右翼へ修正（`pos_wing_r_3`、`positioned ^-1.2`）。spin_r と同種のコピペミス。tp 横移動 `^0.3` は旧のまま（gameplay 影響小のため据え置き）。
- 接地は `check_landing`。`# 2連`（怒り時 `lance_vertical_*_to_r` tween）は AJ 名前空間置換のみ。
- **削除**: 過去の bash 生成ミスで出来た空グループ `event/197609/` を削除。
移植元: `mhdp_monster_valk_bak/.../core/tick/animation/event/<group>/`
各グループ: `main`（frame 監視: 効果音/移動/攻撃発火/終端 end）、`attack`（apply_attack.m）、`end`（→ change/main）、その他 particle/sound/turn_start 等
- 旧 frame 番号（`aj.<anim>.frame`）はそのまま流用
- AJ 名前空間 `animated_java:valk_aj/` → `animated_java_valk:valk/`
- `.playing` タグ `aj.valk_aj.animation.X.playing` → `animated_java_valk.valk.animation.X.playing`
- 攻撃実行は `mhdp_monsters:core/util/tick/event/apply_attack.m` / `start_attack.m` 方式へ（旧 `mhdp_core:player/damage/entity_to_*` から書き直し）
- 翼槍技の attack は発動翼に応じ `.Right`/`.Left` の技名を選択
- ロケータ参照は `at_locator`/`as_locator`
- **接地処理は dino 準拠で `function mhdp_monsters:core/util/tick/move/check_landing` の1行に置換**（旧valkの
  `execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground` +
  `execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~` の2行パターンは使わない）。
  今後作成する全 event/<group>/main.mcfunction に適用する（lance_idle で適用済み）。

**グループ別チェックリスト**（`[ ]`=未 `[x]`=完了 `[~]`=一部）:
- [ ] comet_phase_1  [ ] comet_phase_2  [ ] comet_phase_3  [ ] comet_phase_4  [ ] comet_phase_5
- [ ] death_flying
- [ ] lance_anger
- [ ] lance_biim_1  [ ] lance_biim_2
- [ ] lance_bite
- [ ] lance_charge  [ ] lance_charge_damage  [ ] lance_charge_end  [ ] lance_charge_start
- [ ] lance_damage_body_l  [ ] lance_damage_body_r
- [ ] lance_damage_counter  [ ] lance_damage_counter_end  [ ] lance_damage_counter_end_mirror
- [ ] lance_damage_counter_head_start  [ ] lance_damage_counter_mirror
- [ ] lance_damage_counter_wing_l_start  [ ] lance_damage_counter_wing_r_start
- [ ] lance_damage_down_l  [ ] lance_damage_down_r
- [ ] lance_damage_flying
- [ ] lance_damage_head  [ ] lance_damage_tail  [ ] lance_damage_tail_break
- [ ] lance_damage_wing_l  [ ] lance_damage_wing_r
- [ ] lance_dashattack
- [ ] lance_death
- [ ] lance_down_end_l  [ ] lance_down_end_r  [ ] lance_down_l  [ ] lance_down_r
- [ ] lance_flytackle  [ ] lance_flytackle_end  [ ] lance_flytackle_repeat  [ ] lance_flytackle_start
- [x] lance_idle  [ ] lance_idle_short
- [ ] lance_move  [ ] lance_move_start  [ ] lance_moveback
- [ ] lance_search
- [x] lance_spear_l_to_r  [x] lance_spear_r_to_l
- [x] lance_spear_to_spin_l  [x] lance_spear_to_spin_r
- [ ] lance_tackle
- [ ] lance_to_shoot
- [ ] lance_turn_l  [ ] lance_turn_r
- [x] lance_upper_l  [x] lance_upper_r
- [x] lance_vertical_l  [x] lance_vertical_l_to_r  [x] lance_vertical_r  [x] lance_vertical_r_to_l
- [x] lance_vertical_turn_l  [x] lance_vertical_turn_r
- [ ] lance_voice
- [ ] shoot_bomb_forward  [ ] shoot_bomb_side
- [ ] shoot_idle
- [ ] shoot_move  [ ] shoot_move_start  [ ] shoot_moveback
- [ ] shoot_sault  [ ] shoot_sault_before
- [ ] shoot_shot_forward  [ ] shoot_shot_horizon
- [ ] shoot_step
- [ ] shoot_sweep_anger_l  [ ] shoot_sweep_anger_r  [ ] shoot_sweep_l  [ ] shoot_sweep_r
- [ ] shoot_to_lance
- [ ] shoot_turn_l  [ ] shoot_turn_r
- [ ] shoot_vertical_l  [ ] shoot_vertical_r
- [ ] state_paralysis

### Stage 6 — util / models / phase / debug / advancement / 弾  🔶 util 完了（2026-09-09）
- [x] `core/util/fetch_player.mcfunction`（**新設**。dino/ranposu 準拠。Mns.Candidate.Valk / Mns.Valk.Search / on_battle/check_target 使用）
- [x] `core/util/apply_blink.mcfunction` / `end_blink.mcfunction`（`animated_java_valk:valk/as_node` + `item_model` component。head_upper × break/anger 4状態。**モデルIDは仮TODO**）
- [x] `core/util/show_bossbar.mcfunction`（`bossbar set mhdp_monster:valk players @a[tag=Ply.State.MnsTarget]`）
- [x] `core/util/show_toast.mcfunction` / `hide_toast.mcfunction`（`advancement grant/revoke mhdp_monster_valk:toast_break` + schedule 5t）
- [x] `core/util/models/*`（17ファイル: `ignite_start[_left/_right]`, `ignite_end[_left/_right]`, `anger_start`, `anger_end`, `break_head`, `break_arm_left/right`, `break_wing_left/right`, `break_tail_cut`, `chest_glow_start/end`, `model_interrupt`）
  - **旧の `on passengers ... item.id="minecraft:white_dye" + custom_model_data:<数値>` を dino 準拠の `execute [if ...] run function animated_java_valk:valk/as_node {name: '<bone>', command: 'data modify entity @s item.components."minecraft:item_model" set value "<ID>"'}` へ変換**。`white_dye` 行は削除。
  - **モデルIDは全て仮のプレースホルダ**（`minecraft:aj_sub/valk/<bone>_<variant>` / 通常状態は `animated_java_valk:blueprint/valk/<bone>`）。各ファイル冒頭に `# TODO` あり。**AJ 再エクスポート後に実際の aj_sub / blueprint 名へ差し替え必須**。
  - `anger_start`/`anger_end` から `tag @s add/remove Mns.State.IsAnger` は削除（`start_anger.m`/`end_anger.m` 側で処理。`end_anger.m` は `$function mhdp_monster_valk:core/util/models/anger_end` を呼ぶ）。
  - `models/ignite_start` / `ignite_end`（両翼版）は `ignite_start_left`+`ignite_start_right` を呼ぶだけの簡略デリゲータ（`model_interrupt` が `ignite_end` を参照）。
  - **省略**: `models/break_tail`（旧は dino 丸コピペ = `aj.dino_aj.bone.*` / `Mns.Dino.State.*` 参照、valk 未使用。valk 尻尾は切断のみ = `break_tail_cut`）。
- [x] **`core/util/phase/*` は生成しない**（判断: 旧 valk の phase/ は全て dino の丸コピペ [`#> mhdp_monster_dino:...` ヘッダ / `Mns.Dino.State.HeadHeat` / `Mns.Dino.PhaseCount.*` / dino専用 models 参照]。新 valk コードから `core/util/phase` への参照は 0 件。valk は頭/尻尾の赤熱化・風化ギミックを持たない [ジェット点火 = ignite / 龍気形態 = shoot で別管理]。**valk に phase/ は不要**）。
- [ ] `core/debug/interrupt.mcfunction` / `interrupt_anger.mcfunction`
- [ ] `advancement/toast_break.json`（icon = `icons/valk`。show_toast が参照）
- [ ] 弾システム（assets 側 ObjectId 定義 + monster 側 summon 呼び出し）※ユーザーと要相談

---

## 次に着手
**Stage 5-C 続き**（11/85 approve 済み: lance_idle + lance_spear系4 + lance_vertical系6）。ここでコミット可。次のグループはユーザー指示待ち。
軸合わせは `alignment_start.m`/`alignment` 方式で以降統一。hit/attack は `cuboid_preview.m` を `apply_attack.m` 直前に配置（コメントアウトはユーザーがレビュー時に実施）。地面ひび割れは `api:object/summon.m {ObjectId:16}`。
