#> mhdp_monster_ranposu:core/tick/animation/event/damage_counter/main
#
# アニメーションイベントハンドラ 怯み・相殺
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.damage_counter.frame matches 69 run function mhdp_monster_ranposu:core/tick/animation/event/damage_counter/end
