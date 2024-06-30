#> mhdp_monster_ranposu:core/tick/animation/event/tackle/main
#
# アニメーションイベントハンドラ タックル
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.frame matches 1 run function mhdp_monster_ranposu:core/tick/animation/event/tackle/turn_start
    execute if score @s aj.frame matches 6 run function mhdp_monster_ranposu:core/tick/animation/event/tackle/turn_start
    execute if score @s aj.frame matches 1..10 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.frame matches 1..5 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.frame matches 6..10 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.frame matches 24..26 at @s run tp @s ^ ^ ^1
    execute if score @s aj.frame matches 27..30 at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.frame matches 31..40 at @s run tp @s ^ ^ ^0.3
    execute if score @s aj.frame matches 41..47 at @s run tp @s ^ ^ ^0.1

# 効果音
    execute if score @s aj.frame matches 20 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.frame matches 21 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.frame matches 21 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.frame matches 38 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.frame matches 38 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.frame matches 24..34 run function mhdp_monster_ranposu:core/tick/animation/event/tackle/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.frame matches 69 run function mhdp_monster_ranposu:core/tick/animation/event/tackle/end
