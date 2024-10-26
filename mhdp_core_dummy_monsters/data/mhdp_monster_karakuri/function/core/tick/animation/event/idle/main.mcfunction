#> mhdp_monster_karakuri:core/tick/animation/event/idle/main
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_karakuri:core/tick/animation/event/tick

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.idle.frame matches 57 run function mhdp_monster_karakuri:core/tick/animation/event/idle/end
