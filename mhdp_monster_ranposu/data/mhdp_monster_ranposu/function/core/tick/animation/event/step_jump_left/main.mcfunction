#> mhdp_monster_ranposu:core/tick/animation/event/step_jump_left/main
#
# アニメーションイベントハンドラ 回り込み急襲
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.frame matches 1..27 at @s run tag @n[tag=Mns.Target.Ranposu] add Temp.Rotate.Target
    execute if score @s aj.frame matches 1..27 at @s run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.frame matches 1..18 at @s run tp @s ^1 ^ ^
    execute if score @s aj.frame matches 28 at @s run function mhdp_monster_ranposu:core/tick/animation/event/step_jump_left/move_start
    execute if score @s aj.frame matches 30..44 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 効果音
    execute if score @s aj.frame matches 2 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.frame matches 3 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.frame matches 3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.frame matches 10 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.frame matches 10 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.frame matches 18 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.frame matches 30 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.frame matches 30 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.frame matches 43 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.frame matches 43 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.frame matches 32..44 run function mhdp_monster_ranposu:core/tick/animation/event/step_jump_left/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態
    execute if score @s aj.frame matches 30 run tag @s add Mns.State.IsFlying
    execute if score @s aj.frame matches 44 run tag @s remove Mns.State.IsFlying

# 終了
    execute if score @s aj.frame matches 99 run function mhdp_monster_ranposu:core/tick/animation/event/step_jump_left/end
