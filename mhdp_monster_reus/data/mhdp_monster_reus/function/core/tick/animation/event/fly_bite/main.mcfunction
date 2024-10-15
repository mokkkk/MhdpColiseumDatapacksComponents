#> mhdp_monster_reus:core/tick/animation/event/fly_bite/main
#
# アニメーションイベントハンドラ 飛行噛みつき
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.fly_bite.frame matches 2 run function mhdp_monster_reus:core/tick/animation/event/fly_bite/turn_start
    execute if score @s aj.fly_bite.frame matches 6 run function mhdp_monster_reus:core/tick/animation/event/fly_bite/turn_start
    execute if score @s aj.fly_bite.frame matches 2..10 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.fly_bite.frame matches 3..8 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.fly_bite.frame matches 21..31 at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.fly_bite.frame matches 32..40 at @s run tp @s ^ ^ ^0.5
    execute if score @s aj.fly_bite.frame matches 41..48 at @s run tp @s ^ ^ ^0.3

# 効果音
    execute if score @s aj.fly_bite.frame matches 6 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_bite.frame matches 15 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_bite.frame matches 38 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 攻撃
    execute if score @s aj.fly_bite.frame matches 21..31 run function mhdp_monster_reus:core/tick/animation/event/fly_bite/attack

# 接地
    execute if score @s aj.fly_bite.frame matches 1..40 at @s if block ~ ~-1.4 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.1 ~ ~ ~
    execute if score @s aj.fly_bite.frame matches 1..40 at @s unless block ~ ~-1.3 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~
    execute if score @s aj.fly_bite.frame matches 41.. at @s if block ~ ~-2.1 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.1 ~ ~ ~
    execute if score @s aj.fly_bite.frame matches 41.. at @s unless block ~ ~-2.0 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.fly_bite.frame matches 52 run function mhdp_monster_reus:core/tick/animation/event/fly_bite/end
