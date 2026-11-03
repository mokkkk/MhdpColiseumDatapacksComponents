#> mhdp_monster_reus:core/tick/animation/event/land_damage_counter/main
#
# アニメーションイベントハンドラ 相殺怯み
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_damage_counter.frame matches 59 run function mhdp_monster_reus:core/tick/animation/event/land_damage_counter/end
