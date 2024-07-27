#> mhdp_monster_reus:core/tick/animation/event/fly_end/main
#
# アニメーションイベントハンドラ 着地
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.fly_end.frame matches 15 at @s run function mhdp_monster_reus:core/tick/animation/event/fly_end/move_start
    execute if score @s aj.fly_end.frame matches 16..26 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 演出
    execute if score @s aj.fly_end.frame matches 6 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_end.frame matches 16 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_end.frame matches 26 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_end.frame matches 26 run particle block{block_state:"minecraft:sand"} ~ ~0.5 ~ 2 0.5 2 0 30

# 風圧怯み
    execute if score @s aj.fly_end.frame matches 26 run data modify storage mhdp_core:temp Damage set value {WindValue:1,GuardValue:1}
    execute if score @s aj.fly_end.frame matches 26 positioned ^ ^ ^ as @a[tag=Ply.State.EnableDamage,distance=..4.5] facing entity @s feet positioned as @s run function mhdp_core:player/damage/wind/main
    execute if score @s aj.fly_end.frame matches 26 run data remove storage mhdp_core:temp Damage

# 接地
    execute if score @s aj.fly_end.frame matches 27.. at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.fly_end.frame matches 27.. at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態変更
    execute if score @s aj.fly_end.frame matches 27 run tag @s remove Mns.State.IsFlying
    execute if score @s aj.fly_end.frame matches 27 run tag @s remove Mns.Reus.State.Flying

# 終了
    execute if score @s aj.fly_end.frame matches 54 run function mhdp_monster_reus:core/tick/animation/event/fly_end/end
