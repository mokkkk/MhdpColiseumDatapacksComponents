#> mhdp_monster_dino:core/tick/animation/event/tick
#
# アニメーションイベントハンドラ
#
# @within function mhdp_monster_dino:core/tick/tick

# 待機
    execute if entity @s[tag=aj.dino_aj.animation.idle.playing] run function mhdp_monster_dino:core/tick/animation/event/idle/main


# 嚙みつき
    execute if entity @s[tag=aj.dino_aj.animation.bite.playing] run function mhdp_monster_dino:core/tick/animation/event/bite/main
