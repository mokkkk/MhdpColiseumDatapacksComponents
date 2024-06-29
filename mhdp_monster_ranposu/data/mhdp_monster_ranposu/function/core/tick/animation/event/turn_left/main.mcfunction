#> mhdp_monster_ranposu:core/tick/animation/event/turn_left/main
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.frame matches 1 run function mhdp_monster_ranposu:core/tick/animation/event/turn_left/turn_start
    execute if score @s aj.frame matches 4..14 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 演出
    execute if score @s aj.frame matches 4 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.frame matches 14 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.frame matches 21 run function mhdp_monster_ranposu:core/tick/animation/event/turn_left/end
