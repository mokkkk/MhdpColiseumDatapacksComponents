#> mhdp_monster_valk:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_valk:core/tick/tick



# 警戒
    # execute if entity @s[tag=aj.valk_aj.animation.search.playing] run function mhdp_monster_valk:core/tick/animation/event/search/main

## 彗龍
# 待機
    execute if entity @s[tag=aj.valk_aj.animation.lance_idle.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_idle/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_idle_short.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_idle_short/main

# 変形・彗龍→龍気
    execute if entity @s[tag=aj.valk_aj.animation.lance_to_shoot.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_to_shoot/main

# 咆哮
    execute if entity @s[tag=aj.valk_aj.animation.lance_voice.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_voice/main

# 軸合わせ
    execute if entity @s[tag=aj.valk_aj.animation.lance_turn_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_turn_r/main
    execute if entity @s[tag=aj.valk_aj.animation.lance_turn_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_turn_l/main

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
