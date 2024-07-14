#> mhdp_monster_ranposu:core/tick/animation/event/state_paralysis/main
#
# アニメーションイベントハンドラ 麻痺
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 演出
    particle dust{color:[1.000,0.969,0.000],scale:1.5} ~ ~2 ~ 1.6 1 1.6 0.15 5

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    scoreboard players remove @s Mns.Paralysis.Timer 1
    execute if score @s Mns.Paralysis.Timer matches ..0 run function mhdp_monster_ranposu:core/tick/animation/event/state_paralysis/end
