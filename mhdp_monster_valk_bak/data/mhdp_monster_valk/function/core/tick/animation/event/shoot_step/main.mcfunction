#> mhdp_monster_valk:core/tick/animation/event/shoot_step/main
#
# アニメーションイベントハンドラ ステップ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.shoot_step.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/shoot_step/turn_start
    execute if score @s aj.shoot_step.frame matches 2..12 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate
    execute if score @s aj.shoot_step.frame matches 2 at @s run function mhdp_monster_valk:core/tick/animation/event/shoot_step/move_start
    execute if score @s aj.shoot_step.frame matches 2..12 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 効果音
    execute if score @s aj.shoot_step.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_step.frame matches 12 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_step.frame matches 12 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.shoot_step.frame matches 24 run function mhdp_monster_valk:core/tick/animation/event/shoot_step/end
