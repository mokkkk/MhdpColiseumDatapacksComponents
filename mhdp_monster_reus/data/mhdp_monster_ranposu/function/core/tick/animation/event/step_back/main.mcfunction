#> mhdp_monster_ranposu:core/tick/animation/event/step_back/main
#
# アニメーションイベントハンドラ バックステップ
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.step_back.frame matches 1 run function mhdp_monster_ranposu:core/tick/animation/event/step_back/turn_start
    execute if score @s aj.step_back.frame matches 1..3 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.step_back.frame matches 4 at @s run function mhdp_monster_ranposu:core/tick/animation/event/step_back/move_start
    execute if score @s aj.step_back.frame matches 4..18 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 効果音
    execute if score @s aj.step_back.frame matches 4 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.step_back.frame matches 4 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.step_back.frame matches 18 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.step_back.frame matches 18 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態
    execute if score @s aj.step_back.frame matches 4 run tag @s add Mns.State.IsFlying
    execute if score @s aj.step_back.frame matches 18 run tag @s remove Mns.State.IsFlying

# 終了
    execute if score @s aj.step_back.frame matches 22 run function mhdp_monster_ranposu:core/tick/animation/event/step_back/end
