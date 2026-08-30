#> mhdp_monster_valk:core/tick/animation/event/shoot_move_start/main
#
# アニメーションイベントハンドラ 移動開始
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.shoot_move_start.frame matches 1 run function mhdp_monster_valk:core/tick/animation/event/shoot_move_start/turn_start
    execute if score @s aj.shoot_move_start.frame matches 2..15 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 効果音
    execute if score @s aj.shoot_move_start.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.shoot_move_start.frame matches 4 run function mhdp_monster_valk:core/tick/animation/event/shoot_move_start/end
