#> mhdp_monster_ranposu:core/tick/animation/event/damage_flying/main
#
# アニメーションイベントハンドラ 空中怯み
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動
    execute if score @s aj.frame matches 4 at @s run function mhdp_monster_ranposu:core/tick/animation/event/damage_flying/move_start
    execute if score @s aj.frame matches 4..11 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 効果音
    execute if score @s aj.frame matches 11 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.frame matches 11 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7

# 接地
    execute if score @s aj.frame matches 11.. at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.frame matches 11.. at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.frame matches 19 run function mhdp_monster_ranposu:core/tick/animation/event/damage_flying/end
