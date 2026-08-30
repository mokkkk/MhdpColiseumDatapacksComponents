#> mhdp_monster_valk:core/tick/animation/event/shoot_turn_r/main
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.shoot_turn_r.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/shoot_turn_r/turn_start
    execute if score @s aj.shoot_turn_r.frame matches 2..15 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.shoot_turn_r.frame matches 2..10 if entity @n[tag=Mns.Target.Valk,distance=..9] at @s run tp @s ^ ^ ^-0.4

# 効果音
    execute if score @s aj.shoot_turn_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_turn_r.frame matches 16 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_turn_r.frame matches 23 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.shoot_turn_r.frame matches 23 run function mhdp_monster_valk:core/tick/animation/event/shoot_turn_r/end
