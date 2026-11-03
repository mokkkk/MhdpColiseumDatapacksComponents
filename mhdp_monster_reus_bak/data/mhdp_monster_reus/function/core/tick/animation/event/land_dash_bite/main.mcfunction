#> mhdp_monster_reus:core/tick/animation/event/land_dash_bite/main
#
# アニメーションイベントハンドラ 突進噛みつき
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.land_dash_bite.frame matches 2..12 at @s run tp @s ^ ^ ^0.3
    execute if score @s aj.land_dash_bite.frame matches 13..18 at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.land_dash_bite.frame matches 19..23 at @s run tp @s ^ ^ ^0.5

# 演出
    execute if score @s aj.land_dash_bite.frame matches 2 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_dash_bite.frame matches 39 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.land_dash_bite.frame matches 22 run function mhdp_monster_reus:core/tick/animation/event/land_dash_bite/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_dash_bite.frame matches 61 run function mhdp_monster_reus:core/tick/animation/event/land_dash_bite/end
