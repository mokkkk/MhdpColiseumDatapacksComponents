#> mhdp_monster_valk:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_valk:core/tick/main

## 非発見時・警戒時共通

# 待機
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_idle.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_idle/main

## 彗龍形態

# 2連突き
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_l_to_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_l_to_r/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_r_to_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_r_to_l/main
# 翼槍回転斬り
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_to_spin_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_to_spin_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/main
# 翼槍叩きつけ
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_r/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_l_to_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_r_to_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_r_to_l/main
# 振りむき翼槍叩きつけ
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_turn_l.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_l/main
    execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_turn_r.playing] run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_r/main
