#> mhdp_monster_ranposu:core/tick/animation/event/jump/main
#
# アニメーションイベントハンドラ 急襲
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.jump.frame matches 1 run function mhdp_monster_ranposu:core/tick/animation/event/jump/turn_start
    execute if score @s aj.jump.frame matches 6 run function mhdp_monster_ranposu:core/tick/animation/event/jump/turn_start
    execute if score @s aj.jump.frame matches 11 run function mhdp_monster_ranposu:core/tick/animation/event/jump/turn_start
    execute if score @s aj.jump.frame matches 1..15 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.jump.frame matches 15 at @s run function mhdp_monster_ranposu:core/tick/animation/event/jump/move_start
    execute if score @s aj.jump.frame matches 24..38 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 効果音
    execute if score @s aj.jump.frame matches 20 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.jump.frame matches 24 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.jump.frame matches 24 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump.frame matches 37 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.jump.frame matches 37 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.jump.frame matches 26..38 run function mhdp_monster_ranposu:core/tick/animation/event/jump/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態
    execute if score @s aj.jump.frame matches 24 run tag @s add Mns.State.IsFlying
    execute if score @s aj.jump.frame matches 38 run tag @s remove Mns.State.IsFlying

# 終了
    execute if score @s aj.jump.frame matches 99 run function mhdp_monster_ranposu:core/tick/animation/event/jump/end
