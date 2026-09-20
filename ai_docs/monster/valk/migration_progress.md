# mhdp_monster_valk 新形式移行 進捗トラッカー

`mhdp_monster_valk_bak`（旧形式）→ `mhdp_monster_valk`（新形式）への移行進捗。
セッションをまたぐ再開はこのファイルを起点にする。作業ブランチ: `feature/update_valstrax`。

> **最終保存状態**: Stage 1〜4 完了 + Stage 5-A approve 済み + **Stage 5-C 59/85 approve済** + Stage 6 util 完了 + Stage 6-S バッチ1 完了（10047.valk_red_flash に IsFollow Override 追加済み）。
> **⚠ Stage 6 タスク**: event 内の `# TODO(Stage6):` VFX/弾演出は、対応 object 作成後に `api:object/summon.m {ObjectId:...}` を記載する。`grep -rn 'TODO(Stage6)' mhdp_monster_valk/` で一覧。
> lance_upper レビュー反映（2026-09-08）: 突き上げダメージは `attack` 内の縦長1ボックス（`Offset_Z:28.5`,`Scale_X/Y:3.4`,`Scale_Z:43`）、演出は `attack_effect`（旧 attack_sub 改名・ダメージなし）を前方 0..50 の11点で呼ぶ。main の attack 呼び出しは `positioned ^±1.2 ^1 ^12 rotated ~±3 ~`。
> lance_vertical レビュー反映（2026-09-07）: お手は start_attack なし / 振り下ろし中判定 `attack_swing`+`hit_swing` 新設 / 地面ひび割れ → `api:object/summon.m {ObjectId:16}` + `dust_pillar` / 着弾箱 `Scale 5/7/4 Offset_Y2` / 空 dir `197609` 削除。**RedFlash は一時 `particle flash{color}` を採用したが、2026-09-13 に `assets:object/10047.valk_red_flash` 実装完了に伴い `api:object/summon.m {ObjectId:10047}` へ差し戻し済み**（下記参照）。
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
- 弾システムは `mhdp_core:assets` 側 + `api:object/summon.m {ObjectId:...}`（dino 方式）。**Stage 6-S で `assets:object/1004x.valk_*` へ移植**（旧 `core/tick/shot/*` 19ファイルの中身を object の summon/init/tick へ移す。monster 側に弾ループは持たない）。計画は下記「Stage 6-S」。仕様 `spec §3.18`。
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

#### 5-C: event/<group>/*（85 グループ）  ✅ 59/85 approve済

**state_paralysis（麻痺）で追加した扱い**（2026-09-14）:
- 唯一 frame監視を使わないグループ。毎tick `Mns.Paralysis.Timer` を1減算し、0以下になったら `end`（`lance_idle_short` へ遷移）。`reaction/paralysis.mcfunction`（Stage4で移行済み）から `Mns.Paralysis.Timer` を `Timer.Max` にセットして呼ばれる。
- **バグ修正（2026-09-14、ユーザー指摘）**: `Mns.State.IsParalysis` タグが `state_paralysis/end` で解除されないのは旧仕様の不具合と判明 → `end.mcfunction` に `tag @s remove Mns.State.IsParalysis` を追加して修正（`lance_down_end_l/r`・`break/tail_cut` に加え、通常の麻痺解除時にも確実に解除されるように）。
- 接地は `check_landing` に統一。

**lance_idle_short / lance_to_shoot / shoot_to_lance（短縮待機・形態変化、3グループ）で追加した扱い**（2026-09-14）:
- **lance_idle_short**: 攻撃・軸合わせなしの短縮待機。`lance_upper` の `end.mcfunction` から `change/main` を経由せず直接tweenされる先（既にStage5-Cのlance_upper移行時に配線済み）。
- **lance_to_shoot（彗龍→龍気）/ shoot_to_lance（龍気→彗龍）**: `change/play/main.mcfunction` の `Anim.Change.LanceToShoot`/`Anim.Change.ShootToLance` から呼ばれる形態変化アニメ。frame2で `Mns.Valk.State.IsShoot` タグを付与/削除する。
  - **レビュー反映（2026-09-14、ユーザー指示）**: 状態変化処理をインライン1行から `core/util/phase/to_shoot.mcfunction`（`tag @s add Mns.Valk.State.IsShoot`）/ `core/util/phase/to_lance.mcfunction`（`tag @s remove Mns.Valk.State.IsShoot`）に切り出し（当初 `lance_to_shoot`/`shoot_to_lance` の名前で作成したが、ユーザー指示で `to_shoot`/`to_lance` にリネーム）。呼び出し元は該当frameで1行 `function .../core/util/phase/to_shoot|to_lance` を呼ぶだけに簡略化（`charge_start`/`charge_end` と同じ切り出しパターン）。
- 両形態変化グループに `m.particle_head.mcfunction`（`voice`用ヘッダの誤配置・`main.mcfunction`から未参照）が旧コードに残っていたが dead code のため移植せず。
- 接地は3グループとも `check_landing` に統一。

**lance_anger / lance_death / death_flying（怒り・討伐、3グループ）で追加した扱い**（2026-09-14）:
- **lance_anger（怒り開始の咆哮）**: `lance_voice` と構造がほぼ同一（旧の怯み専用API `mhdp_core:player/damage/voice/main` 呼び出し）だったため、**`mhdp_monster_dino:core/tick/animation/event/anger/*` を確認し、dino でも `voice` と全く同じ `AttackName:"Voice"` を再利用する `apply_attack_distance.m` 方式だった**ことを確認 → lance_voice と同じ変換方針をそのまま適用（`attack.mcfunction` 新設、`particle_head.mcfunction` 新設して `m.`プレフィックス除去）。dino に前例があったため、ユーザーへの確認は不要と判断（lance_voice のときの確立済み方針の横展開）。
- **lance_death（地上讨伐）/ death_flying（飛行中討伐）**: 攻撃・軸合わせなしの単純な最終アニメーション。接地は `check_landing` に統一。末尾の「終了」行は旧コードで**既にコメントアウトされ未使用**（討伐は終端状態のため次アニメーションへの遷移が無い。`Mns.General.BlinkTimer` を巨大値にしてまばたき停止、`Mns.State.IsCanCarving`+`Carving.Count` で剝ぎ取り可能化する処理のみ）→ 対応する `end.mcfunction`（中身が `lance_idle/end` の誤コピペで未参照）は移植せず。
- **death_flying の呼び出し経路確認**: `core/death/death.mcfunction` の `Mns.State.IsFlying` 分岐は共通ユーティリティ `mhdp_monsters:core/util/damage/death_flying`（影の位置へワープするだけの汎用処理）を呼ぶのみで、per-monster の `event/death_flying/` イベントへの明示的な tween 呼び出しはどこにも無い。dino 側も同様の構造（`mhdp_monster_dino:core/death/death.mcfunction` も同じ共通utilを呼ぶのみ）と確認済みのため、`death_flying` AJ アニメーションは AJ 側の自動遷移で再生される前提として扱う（新規の配線は不要）。
- **レビュー反映（2026-09-14、ユーザー指摘）**: `death_flying`/`lance_damage_flying`（旧称damage_flying相当）の「移動」処理を、旧来の `move_to_target_calc`/`move_to_target_move`（＋専用 `move_start.mcfunction`）方式から、**dino が実際に使っている最新API `mhdp_monsters:core/util/tick/event/vector_move_offset_start.m {Tick:6,OffsetX:0.0,OffsetY:0.0,OffsetZ:0.0,IsAdjustLand:"true"}` + `vector_move`** に置換（`dino:death_flying/main` および `dino:damage_flying/main` で確認。マーカー summon 不要、`IsAdjustLand:"true"` が旧on_ground相当）。両グループの `move_start.mcfunction` は不要になったため削除。**同一の move_to_target_calc/move_to_target_move パターンを使う他グループ（`lance_flytackle_*`, `lance_move` 系）は今回の指摘範囲外**（それらは移動先マーカー `Mns.MovePos.Valk` を使う別ユースケースで、`vector_move_offset_start.m` のようなオフセット単発移動とは要件が異なるため、dino側にも該当する移行例が無い限り現状維持）。

**lance_charge_start / lance_charge / lance_charge_damage / lance_charge_end（龍気吸引、4グループ）で追加した扱い**（2026-09-14）:
- 流れ: `lance_charge_start`（助走）→ `lance_charge`（吸引ループ、`Mns.Valk.ChargeCount` を1ずつ加算し6まで自己ループ、7周目で `lance_charge_end` へ）→ 通常は `lance_charge_end`（解放・攻撃準備完了）だが、吸引中に胸(BodySp/PartId9)へ十分ダメージが入ると Stage4 で既に配線済みの `reaction/body_sp.mcfunction` から直接 `lance_charge_damage` へ割り込み遷移。
- **肉質変化**: `lance_charge_start` frame27 で胴/両腕の `HitBox` の `PartId` を通常値(1/3/4)から吸引中専用の `9`（胸=bodySp）へ変更、`lance_charge_damage`/`lance_charge_end` の frame2 で元の値に復元。この仕組みは Stage4 で先に用意されていた `Mns.Valk.BodySp.Damage` 判定と対になっている。
  - **レビュー反映（2026-09-20、ユーザー指示）**: インライン3行だった肉質変化処理を `core/util/phase/charge_start.mcfunction`（PartId→9）/ `core/util/phase/charge_end.mcfunction`（PartId→1/3/4）に切り出し。呼び出し元3箇所（`lance_charge_start`, `lance_charge_damage`, `lance_charge_end`）は該当frameで1行 `function .../core/util/phase/charge_start|charge_end` を呼ぶだけに簡略化。**Stage6で「valk に phase/ は不要」と判断していたが、この吸引専用の肉質変化ロジックに限り `core/util/phase/` を新設して例外的に使用**（valk固有の熱化/風化ギミックが無い点は変わらず、あくまでcharge系の共有ロジック切り出し用途）。
  - **確認済み（2026-09-20）**: charge_start/charge_end の肉質変化を `as_locator` 経由（ロケータ名で直接HitBoxエンティティを`as`指定）に書き換えられないか検討。`mhdp_monster_dino` の `core/util/phase/head_heat_start.mcfunction` 等を確認したが、同種の処理は `scoreboard players set @e[type=slime,tag=...] ...`（タグ指定・`as_locator`不使用）のみで前例なし。ユーザーに確認した結果、**「dinoに同様の処理がないなら現状のまま(`as @e[...]` + タグ指定)で良い」との回答**→ 変更せず現状維持で確定。
- **RedFlash/Bomb VFXをobjectへ置換**: `lance_charge_damage` frame6 の生 `summon text_display ...Mns.Shot.Valk.Vfx.Bomb...`（scale 5f）→ `positioned ^ ^3 ^-2 run function api:object/summon.m {ObjectId:10046}`（`10046.valk_bomb` の既定scaleが5fで完全一致、Override不要）。`lance_charge_end` frame10 の左右ミューズル(`pos_muzzle_r/l_1`)からの生 RedFlash summon（scale 7f, 単発）→ `Arg.Override{Scale:7}` + `api:object/summon.m {ObjectId:10047}`（`IsLong`/`IsFollow` 不要な単発フラッシュ）。
- 6ロケータの吸引演出パーティクル（`m.particle`）は他グループと同じく `m.` プレフィックス除去+ディスパッチャ/内容分離。
- `lance_charge_damage` の `particle.mcfunction`/`m.particle.mcfunction` は中身が `lance_charge` 用のコピペ誤配置かつ `main.mcfunction` から未参照（dead code）→ 移植せず。
- 接地は `check_landing` に統一。

**lance_down_l / lance_down_r / lance_down_end_l / lance_down_end_r（ダウン系4グループ）で追加した扱い**（2026-09-14）:
- `lance_damage_down_*`/`lance_damage_flying` から `Mns.General.DownCount` 経由で遷移してくる先。`lance_down_l/r` は `Mns.State.IsStun` が立っている間、frame監視で毎tick `at_locator {name:"pos_head"}` 経由の `effect_stun.mcfunction`（`particle crit`）を実行（旧 `on passengers ... data.locators.pos_head` マクロから変換）。
- `end.mcfunction` は `Mns.General.DownCount` を1減算し、まだ残っていれば `return run` で自身（`lance_down_l/r`）へ再tween（ダウン継続ループ）、無くなれば `lance_down_end_l/r`（起き上がり）へ遷移。
- `lance_down_end_l/r` の `end.mcfunction` で `Mns.State.IsDown`/`IsStun`/`IsParalysis` を解除して `change/main` へ。
- 接地は `check_landing` に統一。

**lance_damage_*（怯み系17グループ）で追加した扱い**（2026-09-14）:
- いずれも攻撃判定・軸合わせなしの単純な「frame監視で移動/効果音/接地→終了」構造。既存の他グループと同じく接地は `check_landing` に統一。全グループ共通で frame1 に `tag @s remove Mns.Valk.State.IsShoot`（被弾時は強制的に彗龍形態に戻す）を実施。
- **部位別怯み**（`lance_damage_head`/`tail`/`tail_break`/`body_l`/`body_r`/`wing_l`/`wing_r`）: いずれも `end.mcfunction` は素直に `change/main` を呼ぶだけ。`tail_break`（尻尾切断時の専用怯み）も同様で、尻尾切断オブジェクトの召喚自体は別途 `reaction/break/tail_cut`（Stage6-S共通object待ちTODO）側の責務。
- **ダウン**（`lance_damage_down_l`/`_r`）: `end.mcfunction` は `change/main` を呼ばず、`animated_java_valk:valk/animations/lance_down_l|r/tween` へ直接遷移（`lance_down_l/r` グループ自体は未移行だが、tween呼び出しはアニメ名参照のみなので配線可能）。
- **飛行中怯み**（`lance_damage_flying`）: 当初 `move_start.mcfunction`（`move_to_target_calc`）で実装したが、**2026-09-14 のレビューで `mhdp_monsters:core/util/tick/event/vector_move_offset_start.m {Tick:6,OffsetX:0.0,OffsetY:0.0,OffsetZ:0.0,IsAdjustLand:"true"}` + `vector_move` に置換**（dino の `damage_flying/main` が実際にこの方式を使用していると確認。`move_start.mcfunction` は削除）。`end.mcfunction` は `Mns.General.DownCount`（共通engine score）が1以上なら `lance_down_l` へ、そうでなければ `lance_down_end_l` へ分岐（旧のまま、`return run` によるショートサーキット）。
- **反撃硬直（カウンター）系7グループ**（`lance_damage_counter`/`_end`/`_end_mirror`/`_head_start`/`_mirror`/`_wing_l_start`/`_wing_r_start`）: 頭部/右翼始動は `lance_damage_counter_head_start`→`lance_damage_counter`→`lance_damage_counter_end`→`change/main`、**左翼始動のみ `_mirror` 系**（`lance_damage_counter_wing_l_start`→`lance_damage_counter_mirror`→`lance_damage_counter_end_mirror`→`change/main`）を通る非対称構造。旧コードの意図（AJモデルのミラーリング都合か）をそのまま踏襲、対称化などの変更はしていない。
- 全グループ、旧 `end.mcfunction` のヘッダコメントが別グループ（`lance_damage_head`等）を指す誤記だった箇所は、自グループ名に修正。

**lance_flytackle_start / lance_flytackle / lance_flytackle_repeat / lance_flytackle_end（滑空突進、4グループ）で追加した扱い**（2026-09-13）:
- 一連の流れ: `lance_flytackle_start`（助走・発進、精密軸合わせ `turn_to_target_accurate` を frame範囲全体で毎tick実行）→ `lance_flytackle`（直進突撃、`main_sub` を1tickに最大2回実行して倍速移動、`Mns.Temp.Valk.EndFlyTackle` タグで早期終了時の二重実行を抑止）→ 到達/ロストで `lance_flytackle_repeat`（急停止→旋回→再発進、`Mns.Valk.JetCount` が残っていれば）または `lance_flytackle_end`（着地）。`Mns.Valk.JetCount`（Stage5-Aで既に `jet_tackle.mcfunction` から1or2に設定済み・登録済み objective）を1消費するごとにloop/end分岐。
- **攻撃**: AttackName `JetTackle`（body、register済み）。`Offset_Y:1.0,Offset_Z:3.0`,Scale4.0（旧 `distance=..4` を近似採用）。**旧コードに `start_attack`/`end_attack` が一切無い**（相殺不可・連続当たり判定）ため、新形式でも start_attack/end_attack を挟まず `apply_attack.m` を連打する構成をそのまま踏襲（lance_vertical のお手と同じ理由）。`lance_flytackle`(main_sub内)/`lance_flytackle_repeat`(2区間)/`lance_flytackle_end` それぞれに同一内容の `attack.mcfunction` を配置（既存の重複配置パターンを踏襲）。
- **RedFlash演出**: 旧の生 `summon text_display {Tags:["Mns.Shot.Valk.Vfx.RedFlash","...Long"]},scale:[12f,...]}` を `data modify storage api: Arg.Override set value {IsLong:true,IsFollow:true,Scale:12}` + `positioned ^-1 ^3 ^ run function api:object/summon.m {ObjectId:10047}` に置換（`lance_upper` の大サイズ12と同じ値）。追従は `tp @n[type=text_display,tag=10047.IsFollow] ^ ^3 ^`、即時消去は `kill @e[type=text_display,tag=10047.IsFollow]`。
- **10047.valk_red_flash に `IsFollow` Override引数を追加（2026-09-14、ユーザー指示）**: `_index.d.mcfunction` に `#declare tag 10047.IsFollow` 追加、`init/.mcfunction` に `execute if data storage api: Arg.Override{IsFollow:true} run tag @s add 10047.IsFollow` を追加。旧コメント「ロング版（ループ・追従）」から「追従」の記述を分離し、`IsLong`（ループ生存）と `IsFollow`（追従識別タグ付与）を独立した意味に整理。**flytackle系のみ** `IsFollow:true` を渡すように変更し、追従・killのセレクタを `tag=10047.Long` → `tag=10047.IsFollow` に統一（`lance_upper`/`lance_vertical` は指示範囲外のため `10047.Long` のまま未変更）。
- **移動先マーカーの軸合わせ**は `lance_move` と同じ `turn_to_target_accurate` パターン（`Mns.MovePos.Valk`/`Mns.Target.Valk` へのタグ付けを毎tick実行）。
- **`move_start.mcfunction`（repeat/end）は `mhdp_monsters:core/util/other/move_to_target_calc`/`move_to_target_move` を使用**。ほぼ無改変で移植。**⚠ 訂正（2026-09-14）**: 当初「dino の `death_flying`/`breath_backstep` の `move_start.mcfunction` が同一パターンの現行実例」と記載したが誤り。実際には dino の両 `move_start.mcfunction` は main.mcfunction から未参照の死んだレガシーファイル（両方とも実際は `vector_move_offset_start.m`/`vector_move` を使用。下記 lance_damage_flying の訂正参照）。
- **確認済み（2026-09-14、ユーザー説明）— 移動方式の使い分け方針**: `vector_move`（`vector_move_offset_start.m`+`vector_move`）は「決められたtickで目的地まで正確に移動」（定位置移動、死亡/飛行怯みの落下など）。`MovePos`方式（`move_to_target_calc`/`move_to_target_move`+`Mns.MovePos.Valk`マーカー）は「不定のtickで目的地までおおざっぱに移動」（突進系攻撃などプレイヤー位置に応じてアニメ長が変わる場合）。**flytackle系の現状実装（MovePos方式）は正しい、変更不要**。この使い分け方針は今後の新規グループ（他の突進/移動系アニメ）でも判断基準として適用する。
- **de-macro化**: 6ロケータ（`pos_muzzle_r/l_0/1/2`）に向けた噴射パーティクルは `m.particle`/`m.particle_launch`/`m.particle_end` を `particle_muzzle`/`particle_launch_muzzle`/`particle_end_muzzle`（内容, `m.`プレフィックス除去）に、呼び出し元 `particle`/`particle_launch`/`particle_end`（ディスパッチャ、6個の `at_locator` 呼び出し）に再構成。
- **移植しなかった dead code**: 各グループの `turn_start.mcfunction`（main内で不使用、`alignment_start.m` 系や `turn_to_target_accurate` 系に置換済み）。`lance_flytackle`（本体）フォルダ内の `particle.mcfunction`/`m.particle.mcfunction` は中身が `lance_flytackle_start` 用のヘッダ・内容をそのまま持つ誤配置コピペかつ未使用（main/main_subから参照0件）→ 移植せず。
- **保留（意図的に据え置き）**: `lance_flytackle_start/main` 内の移動位置決定セクションに、`Mns.Valk.JetCount matches 2..` の同一 `tp ^ ^ ^3` 行が完全に重複している（旧コードのコピペ起因と思われる無害な冗長行）。挙動に影響しないため旧のまま維持。
- 接地は `check_landing` に統一、モデル演出は Stage6 で確立済みの `ignite_start`/`ignite_end`（両翼簡略版）を使用。

**lance_turn_l/r（軸合わせ旋回）で追加した扱い**（2026-09-13）:
- `alignment_start.m`（`TargetTag:"Mns.Target.Valk"`, `Tick:14`, `MaxRotation:360`）+ `alignment` に統一。旧 `turn_start.mcfunction` は移植せず（`alignment_start.m` に置換）。
- **バグ修正**: 旧 `lance_turn_r/main` の軸合わせ範囲呼び出し（`turn_to_target_rotate`）が `at @s` を欠いていた（`lance_turn_l` にはあった）。CLAUDE.md規則（範囲呼び出しの `alignment` には `at @s` 必須）に合わせ、turn_r 側にも `at @s` を付与。
- 旧 `turn_start.mcfunction` 冒頭の `kill @n[type=area_effect_cloud,tag=Temp.Rotate.Target]`（古い `turn_to_target_calc` 系の残留物掃除）は `alignment_start.m` 方式に置換したことで不要のため引き継がず。

**lance_search（警戒）で追加した扱い**（2026-09-13）: 攻撃・軸合わせなしの単純な待機ループ。接地のみ `check_landing` 化。

**lance_voice（咆哮）で追加した扱い**（2026-09-13、レビュー後に方式変更）:
- 頭部の閃光演出（旧 `m.particle_head`、`on passengers ... data.locators.pos_head` マクロ経由）→ `m.` プレフィックスを外し非マクロ化した `particle_head.mcfunction` を新設、`at_locator {name:"pos_head",...}` から呼ぶ形に統一。
- 胸部発光演出は Stage6 で作成済みの `core/util/models/chest_glow_start`/`chest_glow_end` をそのまま呼ぶ。
- 接地は `check_landing` に統一。
- **ダメージ方式をユーザー指示で変更**: 当初は旧の怯み専用API `mhdp_core:player/damage/voice/main`（`mhdp_core:temp Damage` に `VoiceValue`/`VoiceTime`/`GuardValue` を積む方式）をそのまま踏襲していたが、**ユーザー指示により `mhdp_monster_dino:core/tick/animation/event/voice/attack` を参考にしたダメージなし攻撃（AttackData/`apply_attack_distance.m` 方式）に変更**。register.mcfunction には既にユーザーが `Voice` AttackData（`DamageValue:0.0f, GuardValue:4, VectorType:"Radial", Effect:{EffectId:1,Level:3,Tick:50}`）を追加済みで、それを利用。
  - frame40 に `at_locator {name:"pos_head",command:"execute rotated as @s rotated ~ 0 run function .../attack"}` を配置（dino と同じ「ロケータ回転からpitchだけ0に戻す」パターン）。
  - `attack.mcfunction` は `apply_attack_distance.m {Uid:1004,AttackName:"Voice",...}`（球状判定、Player/Entity とも Distance18.0。旧の `distance=..18` を踏襲、dino は15.0だが値はモンスター毎に異なってよいため据え置き）。対モンスター判定もdinoにならい新規追加（旧はプレイヤーのみ）。
  - `mhdp_core:player/damage/voice/main` 自体は依然有効なAPIだが、**lance_voiceでは不使用**に変更。
- 参考にした `mhdp_monster_reus`（未移行・旧形式のまま）の `land_voice`/`land_anger` は上記の理由で見送り、あくまで dino 準拠。

**lance_move / lance_move_start / lance_moveback（移動系3グループ）で追加した扱い**（2026-09-13）:
- **lance_move**（ループ移動）: 攻撃判定なし。移動目標マーカー `Mns.MovePos.Valk`（area_effect_cloud）への軸合わせは、lance_upper で確立した精密軸合わせ `mhdp_monsters:core/util/tick/event/turn_to_target_accurate`（`TargetTag` 相当のタグ付与 `tag @n[...] add Temp.Rotate.Target` を毎tick実行してから呼ぶ）をそのまま適用。マーカーに接近 or ロスト で `end` へ。
  - 旧 `turn_start.mcfunction` はヘッダが `lance_turn_l` 用のコピペミスで、かつ main から未参照（dead code）→ 移植せず。
  - **レビュー反映（ユーザーがdisk上で修正）**: 終了判定を `run return run function .../end` に変更（ショートサーキット化）、ロスト判定に `distance=..64` の上限を追加（無制限探索を防止）。`end.mcfunction` は Claude が「常にどちらかのタグが付いた状態でしか呼ばれないので到達不能」と判断してコメントアウトのまま提案した末尾 `change/main` を、**ユーザーが明示的に「フォールバック」として有効化**（将来 `lance_move` が他の入口から呼ばれる可能性に備えた安全策とみられる。Claudeの「到達不能」判断は誤りではないが、フォールバックとして残す方が安全という判断）。`# 槍回転`/`# 突進攻撃`/`# フォールバック` の見出しコメントも追加。
- **lance_move_start**（移動開始・単発）: 軸合わせは `alignment_start.m`（`TargetTag:"Mns.MovePos.Valk"`, `Tick:3`, `MaxRotation:360`）+ `alignment`。終了時に `animated_java_valk:valk/animations/lance_move/tween` で `lance_move` ループへ遷移。
- **lance_moveback**（車庫入れ・後退）: 軸合わせは `alignment_start.m`（`TargetTag:"Mns.Target.Valk"`, `Tick:14`, `MaxRotation:360`）+ `alignment`。終了時 `Mns.Temp.Valk.MoveToChangePhase` があれば `change_phase` を挟んでから通常の `change/main`。
- 3グループとも接地は `check_landing` に統一、`turn_start.mcfunction`（move_start/moveback）は `alignment_start.m` 置換のため移植せず。
- MaxRotation は lance_bite 以降の方針（軸合わせに明示的な角度上限が旧に無ければ 360 を採用）を踏襲。

**lance_bite（嚙みつき）で追加した扱い**（2026-09-13）:
- 旧は単一の固定オフセット判定（`positioned ^ ^1 ^4`、`distance=..3.8` の球状）を frame 23..30 の8フレーム連続で呼んでいた。新形式では dino の `bite` グループ（同型の固定オフセット単発攻撃）を参考に、`start_attack.m`（frame23）→ `attack.mcfunction` を frame23..30 の範囲で毎tick呼ぶ → `end_attack`（frame30）という構成に統一。`attack.mcfunction` 内は `positioned` を挟まず `apply_attack.m`（`cuboid_preview.m` も同様）の `Offset_Y:1.0,Offset_Z:4.0` に直接オフセットを埋め込む形（dino/bite/attack と同じ書式）。当たり判定サイズは旧の `distance=..3.8` をそのまま半径近似値としてScale 3.8に採用（lance_spear/vertical と同じ近似方針）。
- AttackData参照名 `Bite`（左右分岐なし、既存registerのまま）。
- 接地は `check_landing` に統一（旧の2行パターンは廃止）。
- **レビュー反映（2026-09-13、ユーザーが disk 上で修正）**: 軸合わせの `MaxRotation` は Claude 提案の 180 ではなく **360** に修正（frame2/7）。移動 `21..27` の tp を `^0.6`→**`^0.9`** に強化。効果音 `sound` の2回目呼び出しを frame25→**frame42** に変更（旧は frame20/25 の2連呼びだったが、frame42 の重複する `playsound block.grass.step` 行と統合する意図と思われる）。意図的編集として尊重。

**lance_dashattack（突進・体当たり）で追加した扱い**（2026-09-13）:
- 旧の軸合わせ `turn_start` はコメントアウトされ未使用（dead code）→ **新形式でも軸合わせなし**（移動のみで直進する仕様）。`turn_start.mcfunction` は移植せず。
- 攻撃は2段構成、AttackName は共通 `DashAttack`（body）: frame17 の単発大判定（`attack.mcfunction`、旧 `^ ^1 ^6` distance..3.8→Scale3.8、爆発演出付き）+ frame18..25 の突進中判定（`attack_dash.mcfunction`、旧 `^ ^1 ^4` distance..3.8→Scale3.8、演出なし）。`start_attack.m` を frame17（攻撃開始）に、`end_attack` を frame25（突進判定終了）に配置し、2つの当たり判定を同一の相殺ウィンドウ内に収めた。
- **レビュー反映（ユーザーがdisk上で調整）**: `attack_dash.mcfunction` の当たり判定を `Player/Entity_Scale_X:3.8`→**`2.8`**（X方向のみ縮小、Y/Zは3.8のまま）に調整。実機確認後、`cuboid_preview` は再度コメントアウトして確定。

**lance_tackle（蛇行突進）で追加した扱い**（2026-09-13）:
- 軸合わせは frame2/7 に `alignment_start.m`（旧 `turn_start` の Tick10 を流用）。**MaxRotation は lance_bite のレビュー結果を踏まえ 360 を採用**（旧コードに明示的角度上限なし）。
- 攻撃は左右への蛇行に対応して2回のヒット窓（frame25..29 / frame41..45）、AttackName は共通 `Tackle`（body）。**複数回ヒットする技の既存ルール通り、判定区間ごとに `start_attack.m`/`end_attack` で個別に挟む**（frame25開始→29終了、frame41開始→45終了の2セット）。
- 当たり判定は旧 `distance=..3.4` をそのまま近似値としてScale3.4（`Offset_Y:1.0,Offset_Z:4.0`）に採用。実機確認後、`cuboid_preview` は再度コメントアウトして確定。
- `turn_start.mcfunction` は `alignment_start.m` に置換のため移植せず。

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
- 龍閃 赤フラッシュ VFX（旧 `summon text_display ... Mns.Shot.Valk.Vfx.RedFlash`）→ 当初 **`particle flash{color}`** に置換していたが、**2026-09-13 に `assets:object/10047.valk_red_flash` 実装完了を受けて `api:object/summon.m {ObjectId:10047}` へ再置換**（`Arg.Override set value {Scale:8}` → 旧スケール8を再現。`.Long` は使わない単発）。l(f38,`^-2 ^1 ^-6`)/r(f38,`^2 ^1 ^-6`)/l_to_r(f11,`^2 ^1 ^-6`)/r_to_l(f11,`^-2 ^1 ^-6`)。turn_l/turn_r には旧に該当箇所なし。
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
- [x] death_flying
- [x] lance_anger
- [ ] lance_biim_1  [ ] lance_biim_2
- [x] lance_bite
- [x] lance_charge  [x] lance_charge_damage  [x] lance_charge_end  [x] lance_charge_start
- [x] lance_damage_body_l  [x] lance_damage_body_r
- [x] lance_damage_counter  [x] lance_damage_counter_end  [x] lance_damage_counter_end_mirror
- [x] lance_damage_counter_head_start  [x] lance_damage_counter_mirror
- [x] lance_damage_counter_wing_l_start  [x] lance_damage_counter_wing_r_start
- [x] lance_damage_down_l  [x] lance_damage_down_r
- [x] lance_damage_flying
- [x] lance_damage_head  [x] lance_damage_tail  [x] lance_damage_tail_break
- [x] lance_damage_wing_l  [x] lance_damage_wing_r
- [x] lance_dashattack
- [x] lance_death
- [x] lance_down_end_l  [x] lance_down_end_r  [x] lance_down_l  [x] lance_down_r
- [x] lance_flytackle  [x] lance_flytackle_end  [x] lance_flytackle_repeat  [x] lance_flytackle_start
- [x] lance_idle  [x] lance_idle_short
- [x] lance_move  [x] lance_move_start  [x] lance_moveback
- [x] lance_search
- [x] lance_spear_l_to_r  [x] lance_spear_r_to_l
- [x] lance_spear_to_spin_l  [x] lance_spear_to_spin_r
- [x] lance_tackle
- [x] lance_to_shoot
- [x] lance_turn_l  [x] lance_turn_r
- [x] lance_upper_l  [x] lance_upper_r
- [x] lance_vertical_l  [x] lance_vertical_l_to_r  [x] lance_vertical_r  [x] lance_vertical_r_to_l
- [x] lance_vertical_turn_l  [x] lance_vertical_turn_r
- [x] lance_voice
- [ ] shoot_bomb_forward  [ ] shoot_bomb_side
- [ ] shoot_idle
- [ ] shoot_move  [ ] shoot_move_start  [ ] shoot_moveback
- [ ] shoot_sault  [ ] shoot_sault_before
- [ ] shoot_shot_forward  [ ] shoot_shot_horizon
- [ ] shoot_step
- [ ] shoot_sweep_anger_l  [ ] shoot_sweep_anger_r  [ ] shoot_sweep_l  [ ] shoot_sweep_r
- [x] shoot_to_lance
- [ ] shoot_turn_l  [ ] shoot_turn_r
- [ ] shoot_vertical_l  [ ] shoot_vertical_r
- [x] state_paralysis

### Stage 6 — util / models / phase / debug / advancement / 弾  🔶 util+models 完了（2026-09-09）／弾は 6-S へ
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
- [x] **`core/util/phase/*` は当初生成しない判断**（旧 valk の phase/ は全て dino の丸コピペ [`#> mhdp_monster_dino:...` ヘッダ / `Mns.Dino.State.HeadHeat` / `Mns.Dino.PhaseCount.*` / dino専用 models 参照]。valk は頭/尻尾の赤熱化・風化ギミックを持たない）。**2026-09-20 に例外追加**: `lance_charge_*`（龍気吸引）の肉質変化（HitBox PartId 切替）ロジックをユーザー指示で `core/util/phase/charge_start.mcfunction`/`charge_end.mcfunction` として新設（Stage 5-C lance_charge系参照）。
- [ ] `core/debug/interrupt.mcfunction` / `interrupt_anger.mcfunction`
- [ ] `advancement/toast_break.json`（icon = `icons/valk`。show_toast が参照）
#### Stage 6-S: 弾 / VFX の `assets:object/` 移行  🔶 バッチ1 完了（2026-09-10）

**バッチ1 実施済み**:
- `assets:object/1004N.valk_*`（9個, 10040-10048）+ `assets:object/alias/1004N/{init,summon,tick}` 作成。
- `10047.valk_red_flash`: 完全実装。`summon/`（text_display, font `vfx/valstrax/red_flash`, 既定 scale 7）/ `init/`（`tp ~ ~ ~ ~ ~` + `Override{IsLong:true}`→`10047.Long` タグ + `Override.Scale`→`init/apply_scale.m` で `transformation.scale` 上書き）/ `tick/`（frame 0-3 送り。`10047.Long` はループ、通常は 5tick で kill）。
- `10040.valk_shot`: 完全実装。`summon/`（item_display, `item_model:"shot/valk/shot"` は **TODO 仮名**）/ `init/` は `# TODO`（狙い補正・Override 未実装）/ `tick/`（`move` ×2/tick + 30tick で強制着弾）/ `tick/move`（dust 演出・プレイヤー/HitBox/ブロック近接で `hit`・`tp ^ ^ ^1`）/ `tick/hit`（`10040.Hit` で二重防止・`as @n[type=item_display,tag=Mns.Root.Valk]` で `apply_attack_distance.m {Uid:1004,AttackName:"Shot"}` 球状判定・爆発 VFX `{ObjectId:10046}`・`kill @s`）。
- 7つの VFX object（comet/burst/jet/star/beam/bomb/thunder）: `summon/`（text_display, 既定 scale 5 = **要調整 TODO**）/ `init/` は `# TODO`（`tp ~ ~ ~ ~ ~` のみ）/ `tick/` は旧 `vfx_*/tick` の frame 送りを移植。
  - kill 型（comet[flash]/burst/bomb）: 旧同様 frame 0-N 送り + comet/burst は opacity フェード、`ObjectTick` 上限で kill。
  - ループ型（jet/star/beam/thunder）: frame 0-1-2 ループ。**`# TODO`: 旧はアニメイベント側で kill していた。`<id>.Life matches 300..` の安全上限は仮値。呼び出し側 kill か適正値に。**
- **配線済み**: `lance_upper_l/r` の RedFlash（frame35 ロング召喚+追従→frame51 kill+大サイズ召喚。`Arg.Override` で `IsLong`/`Scale` 渡し）、`lance_upper_l/r/attack_effect`（11点の Bomb+RedFlash を `{ObjectId:10046}` / `{ObjectId:10047, Scale:6}` へ）。
- **掃除済み**: `_index.d` の `Mns.Shot.Valk` / `.Tail` タグ宣言を削除、`reaction/general` の `kill @e[...RedFlash.Long]` を `tag=10047.Long` に更新。valk 内 `TODO(Stage6)` は 0 に。
- `core/remove/remove.mcfunction` の弾 kill（コメントアウト）はユーザー修正待ちのまま（本人が「弾の後始末処理を経由させる想定」と記載）。

**バッチ2 以降（未着手）**:
- 未読の旧 `vfx_comet` 系の「彗星本体の移動・ジェット追従」ロジック（`comet_phase_1..5` の main / `m.summon_vfx*` / `m.tp_vfx_*`）は comet_phase グループ移行時に確認。彗星ダメージは `comet_phase_4/attack` に。
- `comet_burst` / `comet_jet` の damage が本当に不要か（旧 damage は dino コピペ・未呼び出しを確認済み）→ 実装時に最終確認。
- 各 VFX object の scale 既定値（現状 5）と loop 型の寿命を実機で調整。
- `shoot_*` / `lance_biim_*` / `shoot_bomb_*` グループ移行時に `api:object/summon.m` を直書き。

**`summon/debug.mcfunction` 追加（2026-09-13）**: 9 object 全てに、`Arg.Override` を設定して `api:object/summon.m` で自身を手動召喚するデバッグ関数を追加（実行者の位置・向きに召喚。仕様は spec §3.18 に追記）。`10047.valk_red_flash` は `{IsLong:true,Scale:10}` の実値、他は Override 未確定のため `{}`。以降の全 object にもこのパターンを適用する。

**remove 処理の整備（2026-09-13）**:
- `api:object/remove.mcfunction` 新設（`assets:core/object/remove` を呼ぶだけ。`assets:core/object/remove` 自体は既存で `@s` の `ObjectId` を見て `alias/N/remove` へディスパッチ）。
- 9 object 全てに `remove/.mcfunction`（中身は `kill @s`）+ `alias/1004N/remove.mcfunction` を追加（1000番台 build 系オブジェクトと同じ構成。init/summon/tick/remove の4本柱）。
- 各 object の tick 内の自己終了 `kill @s` を `function assets:object/1004N.valk_xxx/remove/` 呼び出しに置換（将来、複数エンティティ構成の object になっても `remove/` 側で一括処分できるように分離済み。現状は単一エンティティなので中身は `kill @s` のまま）。
- 各 object の `summon/.mcfunction` の `Tags` に **`Asset.Object.Valk`**（valk 全 object 共通タグ）を追加。
- valk の `core/death/death.mcfunction` と `core/remove/remove.mcfunction` に `execute as @e[tag=Asset.Object.Valk] at @s run function api:object/remove` を追加（旧 `remove.mcfunction` のコメントアウトされた `kill @e[tag=Mns.Shot.Valk*]` TODO を置換）。
- `lance_upper` の RedFlash ロング版を直接 `kill @e[type=text_display,tag=10047.Long]` する呼び出し側コードは**未変更**（個別ターゲットの即時消去なので対象外。将来的に `remove/` 経由に揃えるかは要検討）。

**元の計画表（ObjectId 割り当て・Override 仕様）は下記に残置**。


**方針**: 旧 `mhdp_monster_valk_bak/core/tick/shot/*`（19ファイル）を `mhdp_core` の `assets:object/1004x.valk_*` へ移植。monster 側は `api:object/summon.m {ObjectId:N}` を呼ぶだけ。`Mns.Shot.Valk.*` タグ運用・`core/tick/shot/*`・monster tick の弾ループは廃止（tick ループは既に削除済み）。仕様は `ai_docs/monster_datapack_spec.md §3.18`。

**ObjectId 割り当て**（valk = Uid 1004 → `1004x`。dino は `10031`/`10032`）:

**ダメージ方針（ユーザー指示 2026-09-10）**: **object は原則 VFX のみ**。ダメージ判定は本体アニメーションイベント側（`comet_phase_4/attack`, `lance_biim_2/attack_*`, `shoot_bomb_*/attack` など）で `apply_attack` する。object 内で自ダメージするのは `valk_shot`（独立して飛ぶ射撃弾で着弾点が読めないため）**のみ**。`comet_burst` / `comet_jet` は旧に damage コードが残るが**コピペミスの可能性大**（`vfx_comet/damage` は `Uid:1003` / `TailFlame.Flame` の dino コピペ）→ 精読で確定。

| ObjectId | object 名 | 旧 `core/tick/shot/` | 用途 | 自ダメージ | init 処理（Override 引数） |
|---|---|---|---|---|---|
| `10040` | `valk_shot` | `shot/shot/*` | 龍気形態の射撃弾（`shoot_shot_forward/horizon`） | **あり**（`Shot`。object tick 内で `apply_attack_distance.m`） | **TODO** |
| `10041` | `valk_comet` | `vfx_comet/*` | 彗星本体（`comet_phase_*`） | なし（event `comet_phase_4/attack` で判定） | **TODO** |
| `10042` | `valk_comet_burst` | `vfx_comet_burst/*` | 彗星の炸裂 | **精読して確認**（コピペミスなら なし） | **TODO** |
| `10043` | `valk_comet_jet` | `vfx_comet_jet/*` | 彗星のジェット | **精読して確認**（コピペミスなら なし） | **TODO** |
| `10044` | `valk_comet_star` | `vfx_comet_star/tick` | 星型 VFX | なし | **TODO** |
| `10045` | `valk_beam` | `vfx_beam/tick` | 龍閃ビーム VFX（`lance_biim_*`） | なし（event `lance_biim_2/attack_*` で判定） | **TODO** |
| `10046` | `valk_bomb` | `vfx_bomb/tick` | 爆発 VFX（`shoot_bomb_*` の damage は event 側） | なし | **TODO** |
| `10047` | `valk_red_flash` | `vfx_red_flash/tick` | 赤フラッシュ VFX。**実装完了・`lance_upper`（Long+拡大）/`lance_vertical`（単発 Scale:8）/`lance_flytackle`系（Long+IsFollow+拡大）で使用中** | なし | `Override.IsLong`（bool → `10047.Long` タグ。true でループ生存。旧 `Mns.Shot.Valk.Vfx.RedFlash.Long`）, `Override.IsFollow`（bool → `10047.IsFollow` タグ。2026-09-14追加。呼び出し側がこのタグで対象を特定し tp で追従させる。IsLongとは独立した意味）, `Override.Scale`（`lance_upper` は 7 → 12、`lance_vertical` は 8、`lance_flytackle` 系は 12） |
| `10048` | `valk_thunder` | `vfx_thunder/tick` | 雷 VFX（`lance_biim`, `shoot_bomb`） | なし | **TODO** |

> **⚠ `init/.mcfunction` は `valk_red_flash` 以外すべて `# TODO` とする**（ユーザー指示 2026-09-10）。向き固定 `tp @s ~ ~ ~ ~ ~` だけ置き、それ以外（速度・寿命・ターゲット保持・スケール・variant タグ付与・Override 引数の受け取り）は `# TODO: init 固有処理を実装` のコメントで保留。`valk_red_flash` のみ上記 Override 引数（`IsLong` / `Scale`）で実装する。
>
> **Override（`api: Arg.Override.Xxx`）の仕組み**（`valk_red_flash` で使用）: 呼び出し側で `data modify storage api: Arg.Override.<Key> set value <V>` を積んでから `function api:object/summon.m {ObjectId:N}` を呼ぶ。`summon.m` が summon → init を実行し、最後に `Arg.Override` を自動クリア。object の `init/.mcfunction` で `execute store result score @s <Score> run data get storage api: Arg.Override.<Key>` / `execute if data storage api: Arg.Override{<Key>:<V>} run tag @s add <Tag>` で受け取る（`0001.normal_arrow` / `0005.targetting_arrow` / `0006.jump_arrow` の init が実例）。

**valk 固有 object にしないもの**:
- 切断尻尾（旧 `shot/tail/*` + `reaction/macro/m.summon_tail`）→ **全モンスター共通 object として後日 mhdp_core 側で作成予定**（ユーザー指示 2026-09-10）。valk 側では `break/tail_cut` の TODO を「共通 tail_cut object 待ち」として残す。ObjectId 未定。
- `0016.ground_crack`（移行済み・汎用）

（`10047 valk_red_flash` 実装完了・`lance_upper` の TODO 解消済み、`lance_vertical` も `particle flash` から object 版へ戻し済み。2026-09-13）

**`lance_vertical_turn_l/r` へのユーザー追加修正（2026-09-13、承認と同時に反映）**:
- **AttackData の左右を入れ替え**: `turn_l/main` の `start_attack.m` 参照が `Vertical.Left`→`Vertical.Right`、`turn_r/main` が `Vertical.Right`→`Vertical.Left` に変更（「フォルダ名と実際の動作が食い違っていたため」とのこと。AJ アニメーションの実際の左右をユーザーが確認して修正）。
- **RedFlash 召喚を新規追加**: frame34 に `Arg.Override{Scale:8}` + `positioned ^±2 ^1 ^-6 run function api:object/summon.m {ObjectId:10047}`。旧コードに該当箇所なし（vertical 系の他4グループへの拡張として追加）。turn_l は `^2`（右寄り）、turn_r は `^-2`（左寄り）— **修正後の実際の左右に合わせた向き**になっている。
- **追記（2026-09-13）**: `Vertical.Left→Right`（AttackData 側）の入れ替えはユーザーが「余計だった」として取り消し済み。現状 `turn_l`=`Vertical.Left`・`turn_r`=`Vertical.Right` に戻り、`ignite_start_left/right`・`Wing.L/R`・`pos_wing_l/r_3`・`positioned ^1.2/^-1.2` と整合。

**確認済み（2026-09-13）**: `turn_l`/`turn_r` の RedFlash 位置（`^2`/`^-2`、ベース版 `lance_vertical_l/r` とは逆符号）は**意図的**。ユーザーが実際のアニメーションの動きに合わせて設定したもので、修正不要と確認済み。

**各 object の作成物**（`assets:object/1004N.valk_xxx/`）:
- `_index.d.mcfunction`（`#declare tag 1004N.<State>`）
- `summon/.mcfunction`（`summon item_display ...` または旧 VFX が text_display ならそれ）
- `init/.mcfunction`（`tp @s ~ ~ ~ ~ ~` 他）
- `tick/.mcfunction` + sub（`move`/`hit`/`attack`/`wait` 等。旧 `shot/*/tick` `shot/*/damage` `shot/*/main` を移植）
- `assets:object/alias/1004N/{init,summon,tick}.mcfunction` の 3 リダイレクト

**当たり判定の書き換え**（`valk_shot` のみ・`comet_burst`/`comet_jet` は精読後）: 旧 `mhdp_core:player/damage/entity_to_player/main` + 手動 `Temp.Hit`/`Temp.Victim` → `execute at @s as @n[type=item_display,tag=Mns.Root.Valk] run function mhdp_monsters:core/util/tick/event/apply_attack_distance.m {Uid:1004,AttackName:"Shot",...}`（球状）。他の object は VFX 移植のみ（パーティクル/`text` フレーム切替/tp/寿命）。旧 `summon text_display ... Mns.Shot.Valk.Vfx.Bomb`（`shot/shot/damage` 内の二次演出）は `{ObjectId:10046}` 呼び出しへ。

**作業手順（案）**:
1. 旧 `core/tick/shot/*` のうち移植対象を精読（`shot/tick`・`shot/shot/*` は確認済み。`vfx_comet*` / `vfx_beam` / `vfx_bomb` / `vfx_red_flash` / `vfx_thunder` が未確認。`tail/*` は共通 object 化のため valk では対象外）。
2. `assets:object/` に **9 個**（10040-10048）の object フォルダ + alias を作成。自ダメージは `valk_shot`（10040）のみ（`apply_attack_distance.m`）、`comet_burst`/`comet_jet` は精読で判定。残りは VFX のみ（`text` フレーム切替/パーティクル/tp/寿命）。`init/` は 10047 以外すべて `# TODO`。
3. 既存の pending 呼び出しを配線: `lance_upper_l/r` の RedFlash TODO → `{ObjectId:10047}`。`break/tail_cut` の尻尾切断 TODO は**共通 tail_cut object 待ちとして残す**（今回は解消しない）。
4. 未移行アニメ（`comet_phase_*` / `shoot_*` / `lance_biim_*` / `shoot_bomb_*`）は各グループ移行時に `api:object/summon.m` を直接書く（TODO を残さない）。`shoot_bomb_*` の damage は event 側の `apply_attack` で処理（`valk_bomb` は VFX のみ）。
5. `_index.d` から `Mns.Shot.Valk*` タグ宣言を削除（残っていれば）。
6. AttackData の `Comet`/`Beam`/`Shot`/`Bomb.*` の値・`ObjectDamageValue` を実挙動に合わせて調整（ユーザー）。

**注意**: `assets` は共通 `mhdp_core` データパック。valk object 追加＝ mhdp_core 変更（dino_breath の前例あり、想定内）。要 commit 分離の判断（mhdp_core 側と valk 側）。

- [ ] 弾システム（上記 6-S 計画に沿って実施）

---

## 次に着手
**Stage 5-C 続き**（59/85 approve済み）。ここでコミット可。次のグループはユーザー指示待ち。
軸合わせは `alignment_start.m`/`alignment` 方式で以降統一。hit/attack は `cuboid_preview.m` を `apply_attack.m` 直前に配置（コメントアウトはユーザーがレビュー時に実施）。地面ひび割れは `api:object/summon.m {ObjectId:16}`。
