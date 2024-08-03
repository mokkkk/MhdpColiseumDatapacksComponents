#> mhdp_monster_reus:core/tick/animation/event/land_move/main
#
# アニメーションイベントハンドラ 移動
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.land_move.frame matches 1 run function mhdp_monster_reus:core/tick/animation/event/land_move/turn_start
    execute if score @s aj.land_move.frame matches 11 run function mhdp_monster_reus:core/tick/animation/event/land_move/turn_start
    execute if score @s aj.land_move.frame matches 1..20 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute at @s run tp @s ^ ^ ^0.6

# 演出
    execute if score @s aj.land_move.frame matches 2 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_move.frame matches 13 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    particle block{block_state:"minecraft:sand"} ^ ^0.5 ^ 0.7 0.1 0.7 0 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 遷移
    execute if entity @n[tag=Mns.Target.Reus,distance=..6] run function mhdp_monster_reus:core/tick/animation/event/land_move/change

# 終了
    execute if score @s aj.land_move.frame matches 21 run function mhdp_monster_reus:core/tick/animation/event/land_move/end
