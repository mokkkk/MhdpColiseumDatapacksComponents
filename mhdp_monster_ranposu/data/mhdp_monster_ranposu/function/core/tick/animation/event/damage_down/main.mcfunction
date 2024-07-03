#> mhdp_monster_ranposu:core/tick/animation/event/damage_down/main
#
# アニメーションイベントハンドラ 大怯み
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動
    execute if score @s aj.frame matches 1 at @s run function mhdp_monster_ranposu:core/tick/animation/event/damage_down/move_start
    execute if score @s aj.frame matches 1..16 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 効果音
    execute if score @s aj.frame matches 1 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.frame matches 1 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.frame matches 16 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.frame matches 16 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態
    execute if score @s aj.frame matches 2 run tag @s add Mns.State.IsFlying
    execute if score @s aj.frame matches 16 run tag @s remove Mns.State.IsFlying

# 終了
    execute if score @s aj.frame matches 29 run function mhdp_monster_ranposu:core/tick/animation/event/damage_down/end
