#> mhdp_monster_karakuri:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_karakuri:core/tick/tick

# 待機
    execute if entity @s[tag=aj.karakuri_aj.animation.idle.playing] run function mhdp_monster_karakuri:core/tick/animation/event/idle/main

# 噛みつき
    execute if entity @s[tag=aj.karakuri_aj.animation.bite.playing] run function mhdp_monster_karakuri:core/tick/animation/event/bite/main

# 相殺怯み
    execute if entity @s[tag=aj.karakuri_aj.animation.damage_counter.playing] run function mhdp_monster_karakuri:core/tick/animation/event/damage_counter/main
