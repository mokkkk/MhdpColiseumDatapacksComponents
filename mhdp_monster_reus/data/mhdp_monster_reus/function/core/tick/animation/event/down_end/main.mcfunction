#> mhdp_monster_ranposu:core/tick/animation/event/down_end/main
#
# アニメーションイベントハンドラ 起き上がり
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動
    execute if score @s aj.down_end.frame matches 13..18 at @s run tp @s ^ ^ ^0.2
    execute if score @s aj.down_end.frame matches 19..22 at @s run tp @s ^ ^ ^0.1

# 効果音
    execute if score @s aj.down_end.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.down_end.frame matches 13 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 15
    execute if score @s aj.down_end.frame matches 13 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.down_end.frame matches 22 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 15
    execute if score @s aj.down_end.frame matches 22 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.down_end.frame matches 42 run function mhdp_monster_ranposu:core/tick/animation/event/down_end/end
