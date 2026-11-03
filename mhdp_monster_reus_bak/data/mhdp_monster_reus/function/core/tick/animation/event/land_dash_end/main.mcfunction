#> mhdp_monster_reus:core/tick/animation/event/land_dash_start/main
#
# アニメーションイベントハンドラ 突進開始
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.land_dash_start.frame matches 1 run function mhdp_monster_reus:core/tick/animation/event/land_dash_start/turn_start
    execute if score @s aj.land_dash_start.frame matches 1..10 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.land_dash_start.frame matches 15..19 at @s run tp @s ^ ^ ^0.1

# 演出
    execute if score @s aj.land_dash_start.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_dash_start.frame matches 19 run function mhdp_monster_reus:core/tick/animation/event/land_dash_start/end
