#> mhdp_monster_ranposu:core/tick/animation/event/walk_relax/main
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 回転
    function mhdp_monsters:core/util/other/turn_by_value

# 移動
    execute if score @s aj.walk_relax.frame matches ..13 at @s run tp @s ^ ^ ^0.04
    execute if score @s aj.walk_relax.frame matches 14..23 at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.walk_relax.frame matches 24..41 at @s run tp @s ^ ^ ^0.04
    execute if score @s aj.walk_relax.frame matches 41..50 at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.walk_relax.frame matches 51.. at @s run tp @s ^ ^ ^0.04

# 効果音
    execute if score @s aj.walk_relax.frame matches 13 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 1
    execute if score @s aj.walk_relax.frame matches 13 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.walk_relax.frame matches 41 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 1
    execute if score @s aj.walk_relax.frame matches 41 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# # 接地
#     execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
#     execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.walk_relax.frame matches 56 if score @s Mns.General.WalkCount matches 1.. run scoreboard players remove @s Mns.General.WalkCount 1
    execute if score @s aj.walk_relax.frame matches 56 unless score @s Mns.General.WalkCount matches 1.. run function mhdp_monster_ranposu:core/tick/animation/event/walk_relax/end
