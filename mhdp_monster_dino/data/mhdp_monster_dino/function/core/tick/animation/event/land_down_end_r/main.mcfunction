#> mhdp_monster_reus:core/tick/animation/event/land_down_end_r/main
#
# アニメーションイベントハンドラ ダウン
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.land_down_end_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_down_end_r.frame matches 19 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_down_end_r.frame matches 35 run function mhdp_monster_reus:core/tick/animation/event/land_down_end_r/end
