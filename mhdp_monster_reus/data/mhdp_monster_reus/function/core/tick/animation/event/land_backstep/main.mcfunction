#> mhdp_monster_reus:core/tick/animation/event/land_backstep/main
#
# アニメーションイベントハンドラ バックステップ
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.land_backstep.frame matches 1..28 run tag @n[tag=Mns.Target.Reus] add Temp.Rotate.Target
    execute if score @s aj.land_backstep.frame matches 1..28 at @s run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.land_backstep.frame matches 2 at @s run function mhdp_monster_reus:core/tick/animation/event/land_backstep/move_start
    execute if score @s aj.land_backstep.frame matches 2..17 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 効果音
    execute if score @s aj.land_backstep.frame matches 2 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_backstep.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_backstep.frame matches 2 run particle block{block_state:"minecraft:sand"} ~ ~0.5 ~ 1 0.5 1 0 20
    execute if score @s aj.land_backstep.frame matches 17 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_backstep.frame matches 17 run particle block{block_state:"minecraft:sand"} ~ ~0.5 ~ 2 0.5 2 0 30

# 風圧怯み
    execute if score @s aj.land_backstep.frame matches 2 run data modify storage mhdp_core:temp Damage set value {WindValue:2,GuardValue:1}
    execute if score @s aj.land_backstep.frame matches 2 positioned ^ ^ ^3 as @a[tag=Ply.State.EnableDamage,distance=..4.5] facing entity @s feet positioned as @s run function mhdp_core:player/damage/wind/main
    execute if score @s aj.land_backstep.frame matches 2 run data remove storage mhdp_core:temp Damage

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態更新
    execute if score @s aj.land_backstep.frame matches 2 run tag @s add Mns.State.IsFlying
    execute if score @s aj.land_backstep.frame matches 17 run tag @s remove Mns.State.IsFlying

# 終了
    execute if score @s aj.land_backstep.frame matches 29 run function mhdp_monster_reus:core/tick/animation/event/land_backstep/end
