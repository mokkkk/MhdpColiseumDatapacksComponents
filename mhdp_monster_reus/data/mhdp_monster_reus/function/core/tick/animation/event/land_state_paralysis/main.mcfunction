#> mhdp_monster_reus:core/tick/animation/event/land_state_paralysis/main
#
# アニメーションイベントハンドラ 麻痺
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 演出
   execute if predicate {"condition":"minecraft:random_chance","chance":0.4} run particle dust{color:[1.000,0.969,0.000],scale:1} ~ ~2 ~ 1.6 1 1.6 0.15 10

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    scoreboard players remove @s Mns.Paralysis.Timer 1
    execute if score @s Mns.Paralysis.Timer matches ..0 run function mhdp_monster_reus:core/tick/animation/event/land_state_paralysis/end
