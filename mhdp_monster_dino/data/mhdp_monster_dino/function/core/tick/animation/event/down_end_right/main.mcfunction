#> mhdp_monster_dino:core/tick/animation/event/down_end_right/main
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 移動
    execute if score @s aj.down_end_right.frame matches 2..13 at @s run tp @s ^0.1 ^ ^
    execute if score @s aj.down_end_right.frame matches 18..30 at @s run tp @s ^0.3 ^ ^

# 効果音
    execute if score @s aj.down_end_right.frame matches 2..4 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.down_end_right.frame matches 17 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30
    execute if score @s aj.down_end_right.frame matches 17 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.down_end_right.frame matches 30 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30
    execute if score @s aj.down_end_right.frame matches 30 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.down_end_right.frame matches 45 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.down_end_right.frame matches 45 run function mhdp_monster_dino:core/tick/animation/event/down_end_right/end
