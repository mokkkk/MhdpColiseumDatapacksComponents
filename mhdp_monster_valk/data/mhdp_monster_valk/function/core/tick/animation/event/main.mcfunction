#> mhdp_monster_valk:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_valk:core/tick/tick

## 共通
# 警戒
    execute if entity @s[tag=aj.valk_aj.animation.lance_search.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_search/main

# 待機
    execute if entity @s[tag=aj.valk_aj.animation.lance_idle.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_idle/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_idle_short.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_idle_short/main

# 討伐
    execute if entity @s[tag=aj.valk_aj.animation.lance_death.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_death/main
    execute if entity @s[tag=aj.valk_aj.animation.death_flying.playing] run function mhdp_monster_valk:core/tick/animation/event/death_flying/main

# 麻痺
    execute if entity @s[tag=aj.valk_aj.animation.state_paralysis.playing] run function mhdp_monster_valk:core/tick/animation/event/state_paralysis/main

## 彗龍
# 怯み
    # 頭
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_head.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_head/main
    # 翼
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_wing_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_wing_r/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_wing_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_wing_l/main
    # 胴・腕・脚
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_body_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_body_r/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_body_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_body_l/main
    # 尻尾
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_tail.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_tail/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_tail_break.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_tail_break/main
    # ダウン
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_down_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_down_r/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_down_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_down_r/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_down_end_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_down_end_r/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_down_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_down_l/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_down_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_down_l/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_down_end_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_down_end_l/main
    # 飛行中ダウン
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_flying.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_flying/main
    # 相殺怯み
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter_head_start.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_head_start/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter_wing_r_start.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_wing_r_start/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter_wing_l_start.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_wing_l_start/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter_mirror.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_mirror/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter_end.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_end/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_damage_counter_end_mirror.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_end_mirror/main

# 龍気吸引
    execute if entity @s[tag=aj.valk_aj.animation.lance_charge_start.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_charge_start/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_charge.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_charge/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_charge_end.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_charge_end/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_charge_damage.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_charge_damage/main

# 変形・彗龍→龍気
    execute if entity @s[tag=aj.valk_aj.animation.lance_to_shoot.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_to_shoot/main

# 咆哮
    execute if entity @s[tag=aj.valk_aj.animation.lance_voice.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_voice/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_anger.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_anger/main

# 軸合わせ
    execute if entity @s[tag=aj.valk_aj.animation.lance_turn_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_turn_r/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_turn_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_turn_l/main

# 車庫入れ
    execute if entity @s[tag=aj.valk_aj.animation.lance_moveback.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_moveback/main

# 移動
    execute if entity @s[tag=aj.valk_aj.animation.lance_move_start.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_move_start/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_move.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_move/main

# 2連突き
    execute if entity @s[tag=aj.valk_aj.animation.lance_spear_r_to_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_r_to_l/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_spear_l_to_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/main

# 翼槍回転斬り
    execute if entity @s[tag=aj.valk_aj.animation.lance_spear_to_spin_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_spear_to_spin_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/main

# 翼槍叩きつけ
    execute if entity @s[tag=aj.valk_aj.animation.lance_vertical_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_r/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_vertical_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/main
    # 振りむき翼槍叩きつけ
        execute if entity @s[tag=aj.valk_aj.animation.lance_vertical_turn_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_r/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_vertical_turn_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_l/main
    # 翼槍叩きつけ・2連
        execute if entity @s[tag=aj.valk_aj.animation.lance_vertical_r_to_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_r_to_l/main
        execute if entity @s[tag=aj.valk_aj.animation.lance_vertical_l_to_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/main

# 翼槍突き上げ
    execute if entity @s[tag=aj.valk_aj.animation.lance_upper_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_upper_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_upper_l/main

# 噛みつき
    execute if entity @s[tag=aj.valk_aj.animation.lance_bite.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_bite/main

# 突進攻撃
    execute if entity @s[tag=aj.valk_aj.animation.lance_dashattack.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_dashattack/main

# 蛇行突進
    execute if entity @s[tag=aj.valk_aj.animation.lance_tackle.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_tackle/main

# 滑空突進
    execute if entity @s[tag=aj.valk_aj.animation.lance_flytackle_start.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_flytackle.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_flytackle_end.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_flytackle_repeat.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/main

# 龍閃
    execute if entity @s[tag=aj.valk_aj.animation.lance_biim_1.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_biim_2.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/main

# 彗星
    execute if entity @s[tag=aj.valk_aj.animation.comet_phase_1.playing] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_1/main
    execute if entity @s[tag=aj.valk_aj.animation.comet_phase_2.playing] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/main
    execute if entity @s[tag=aj.valk_aj.animation.comet_phase_3.playing] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/main
    execute if entity @s[tag=aj.valk_aj.animation.comet_phase_4.playing] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/main
    execute if entity @s[tag=aj.valk_aj.animation.comet_phase_5.playing] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_5/main

## 龍気
# 待機
    execute if entity @s[tag=aj.valk_aj.animation.shoot_idle.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_idle/main

# 変形・龍気→彗龍
    execute if entity @s[tag=aj.valk_aj.animation.shoot_to_lance.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_to_lance/main

# 軸合わせ
    execute if entity @s[tag=aj.valk_aj.animation.shoot_turn_r.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_turn_r/main
    execute if entity @s[tag=aj.valk_aj.animation.shoot_turn_l.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_turn_l/main

# ステップ
    execute if entity @s[tag=aj.valk_aj.animation.shoot_step.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_step/main

# 車庫入れ
    execute if entity @s[tag=aj.valk_aj.animation.shoot_moveback.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_moveback/main

# 移動
    execute if entity @s[tag=aj.valk_aj.animation.shoot_move_start.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_move_start/main
    execute if entity @s[tag=aj.valk_aj.animation.shoot_move.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_move/main

# 翼叩きつけ
    execute if entity @s[tag=aj.valk_aj.animation.shoot_vertical_r.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/main
    execute if entity @s[tag=aj.valk_aj.animation.shoot_vertical_l.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_l/main

# 薙ぎ払い
    execute if entity @s[tag=aj.valk_aj.animation.shoot_sweep_r.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_r/main
    execute if entity @s[tag=aj.valk_aj.animation.shoot_sweep_l.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_l/main
    execute if entity @s[tag=aj.valk_aj.animation.shoot_sweep_anger_r.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/main
    execute if entity @s[tag=aj.valk_aj.animation.shoot_sweep_anger_l.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_l/main

# 射撃
    # 直線
        execute if entity @s[tag=aj.valk_aj.animation.shoot_shot_forward.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/main
    # 拡散
        execute if entity @s[tag=aj.valk_aj.animation.shoot_shot_horizon.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_horizon/main

# 前方爆発
    execute if entity @s[tag=aj.valk_aj.animation.shoot_bomb_forward.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/main

# 側面爆発
    execute if entity @s[tag=aj.valk_aj.animation.shoot_bomb_side.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_side/main

# 前転
    execute if entity @s[tag=aj.valk_aj.animation.shoot_sault_before.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_sault_before/main
    execute if entity @s[tag=aj.valk_aj.animation.shoot_sault.playing] run function mhdp_monster_valk:core/tick/animation/event/shoot_sault/main
