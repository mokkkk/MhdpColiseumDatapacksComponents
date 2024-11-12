#> mhdp_monster_karakuri:core/tick/animation/event/damage_counter/main
#
# アニメーションイベントハンドラ 相殺怯み
#
# @within function mhdp_monster_karakuri:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.damage_counter.frame matches 2 run function mhdp_monster_karakuri:core/tick/animation/event/damage_counter/sound_0
    execute if score @s aj.damage_counter.frame matches 27 run function mhdp_monster_karakuri:core/tick/animation/event/damage_counter/sound_1

# 接地
    # execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    # execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.damage_counter.frame matches 36 run function mhdp_monster_karakuri:core/tick/animation/event/damage_counter/end
