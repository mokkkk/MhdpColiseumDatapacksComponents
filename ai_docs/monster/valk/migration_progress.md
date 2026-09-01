# mhdp_monster_valk 新形式移行 進捗トラッカー

`mhdp_monster_valk_bak`（旧形式）→ `mhdp_monster_valk`（新形式）への移行進捗。
セッションをまたぐ再開はこのファイルを起点にする。作業ブランチ: `feature/update_valstrax`。

> **最終保存状態**: Stage 1〜4 完了 + **Stage 5-A（change/*）approve 済み**。
> 次の作業は **Stage 5-B（event/main ディスパッチャ）→ 5-C（event グループ）** から。再開時は下記「Stage 進捗」→「次に着手」を確認。
> `change/main.mcfunction` はユーザーが disk 上で dino 準拠へ微修正（怒り終了の `!IsAlreadyAnimation` 除去、軸合わせ 99 判定ブロック除去、終了の `IsTurn.Big` 除去）。
> **要確認**: 現状 `change/main` の軸合わせ行は `store result #mhdp_temp_result` が未消費・未リセット、正面時 `play/turn` が `return 99` で早期 return すると `Mns.Temp.IsTurn` が残り play/main も走らず 1tick 何もしない可能性。`play/turn` 側での内部処理化 or 判定復活が要検討（ユーザー編集中）。

## 参照
- 手順書: `ai_docs/monster_datapack_spec.md` / 差分表: `ai_docs/monster_datapack_comparison.md`
- 新形式テンプレ: `mhdp_monster_ranposu`（`mhdp_monster_ranposu_bak` からの同一変換の実例）, `mhdp_monster_dino`
- 共通エンジン: `mhdp_core/data/mhdp_monsters/`

## 前提・確定事項
- **AJ 再エクスポート（`animated_java_valk`）はユーザーが実施**。コードは `animated_java_valk:valk/...` 前提。アニメ名は旧 `valk_aj/animations/` と同一前提。
- `mhdp_core` 側は Uid 1004 配線済み → 変更不要。
- **git commit はユーザーが手動**。Claude は commit すべきタイミングを通知するのみ、勝手に commit しない。
- バッチ単位で作業し、各バッチ終了時にこのトラッカーを更新する。
- `.mcfunction` のコマンドトークン間スペースは必ず1つ（CLAUDE.md 参照）。
- AJ ロケータ参照は `at_locator`/`as_locator`（旧 `on passengers ... data.locators` は不可。CLAUDE.md 参照）。
- 弾システムは `mhdp_core:assets` 側 + `api:object/summon.m {ObjectId:...}`（dino 方式）。**Stage 6 で保留対応**。旧 `core/tick/shot/*` は移植しない。

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

#### 5-B: event/main.mcfunction（ディスパッチャ）  ⬜
- [ ] 全 85 グループの `.playing` 判定行（`animated_java_valk.valk.animation.<anim>.playing`）

#### 5-C: event/<group>/*（85 グループ）  ⬜ 0/85
移植元: `mhdp_monster_valk_bak/.../core/tick/animation/event/<group>/`
各グループ: `main`（frame 監視: 効果音/移動/攻撃発火/終端 end）、`attack`（apply_attack.m）、`end`（→ change/main）、その他 particle/sound/turn_start 等
- 旧 frame 番号（`aj.<anim>.frame`）はそのまま流用
- AJ 名前空間 `animated_java:valk_aj/` → `animated_java_valk:valk/`
- `.playing` タグ `aj.valk_aj.animation.X.playing` → `animated_java_valk.valk.animation.X.playing`
- 攻撃実行は `mhdp_monsters:core/util/tick/event/apply_attack.m` / `start_attack.m` 方式へ（旧 `mhdp_core:player/damage/entity_to_*` から書き直し）
- 翼槍技の attack は発動翼に応じ `.Right`/`.Left` の技名を選択
- ロケータ参照は `at_locator`/`as_locator`

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
- [ ] lance_idle  [ ] lance_idle_short
- [ ] lance_move  [ ] lance_move_start  [ ] lance_moveback
- [ ] lance_search
- [ ] lance_spear_l_to_r  [ ] lance_spear_r_to_l
- [ ] lance_spear_to_spin_l  [ ] lance_spear_to_spin_r
- [ ] lance_tackle
- [ ] lance_to_shoot
- [ ] lance_turn_l  [ ] lance_turn_r
- [ ] lance_upper_l  [ ] lance_upper_r
- [ ] lance_vertical_l  [ ] lance_vertical_l_to_r  [ ] lance_vertical_r  [ ] lance_vertical_r_to_l
- [ ] lance_vertical_turn_l  [ ] lance_vertical_turn_r
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

### Stage 6 — util / models / phase / debug / advancement / 弾  ⬜ 未着手
- [ ] `core/util/fetch_player.mcfunction`（**新設**）
- [ ] `core/util/apply_blink.mcfunction` / `end_blink.mcfunction`（AJ as_node 記法へ）
- [ ] `core/util/show_bossbar.mcfunction`（`@a[tag=Ply.State.MnsTarget]` 方式に統一）
- [ ] `core/util/show_toast.mcfunction` / `hide_toast.mcfunction`
- [ ] `core/util/models/*`（anger_start/end, break_*, chest_glow_*, ignite_*, model_interrupt）
- [ ] `core/util/phase/*`（head_heat, head_heat_end, tail_heat, tail_rust）
- [ ] `core/debug/interrupt.mcfunction` / `interrupt_anger.mcfunction`
- [ ] `advancement/toast_break.json`（icon = `icons/valk`）
- [ ] 弾システム（assets 側 ObjectId 定義 + monster 側 summon 呼び出し）※ユーザーと要相談

---

## 次に着手
**Stage 5-B（animation/event/main.mcfunction ディスパッチャ）→ 5-C（event/<group>/* をバッチ処理）**
