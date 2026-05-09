#> mhdp_monster_ranposu:core/tick/animation/event/tail_right/main
#
# アニメーションイベントハンドラ 尻尾攻撃
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動
    execute if score @s aj.tail_right.frame matches 3..8 run tp @s ^-0.05 ^ ^ ~-2 0
    execute if score @s aj.tail_right.frame matches 9..13 run tp @s ^-0.05 ^ ^ ~-0.5 0
    execute if score @s aj.tail_right.frame matches 20..27 run tp @s ^0.2 ^ ^-0.1 ~18 0
    execute if score @s aj.tail_right.frame matches 28..31 run tp @s ^0.2 ^ ^-0.1 ~4 0

# 効果音
    execute if score @s aj.tail_right.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_right.frame matches 2 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.tail_right.frame matches 15 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_right.frame matches 20 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_right.frame matches 20 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.tail_right.frame matches 31 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_right.frame matches 22 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3

# 攻撃
    execute if score @s aj.tail_right.frame matches 22..30 run function mhdp_monster_ranposu:core/tick/animation/event/tail_right/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.tail_right.frame matches 59.. run function mhdp_monster_ranposu:core/tick/animation/event/tail_right/end
