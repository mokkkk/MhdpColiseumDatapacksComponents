#> mhdp_monster_dino:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_dino:core/tick/tick

# 待機
    execute if entity @s[tag=aj.dino_aj.animation.idle.playing] run function mhdp_monster_dino:core/tick/animation/event/idle/main

# 軸合わせ
    execute if entity @s[tag=aj.dino_aj.animation.turn_l.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_l/main
    execute if entity @s[tag=aj.dino_aj.animation.turn_r.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_r/main
    execute if entity @s[tag=aj.dino_aj.animation.turn_big_l.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_big_l/main
    execute if entity @s[tag=aj.dino_aj.animation.turn_big_r.playing] run function mhdp_monster_dino:core/tick/animation/event/turn_big_r/main

# 嚙みつき
    execute if entity @s[tag=aj.dino_aj.animation.bite.playing] run function mhdp_monster_dino:core/tick/animation/event/bite/main
