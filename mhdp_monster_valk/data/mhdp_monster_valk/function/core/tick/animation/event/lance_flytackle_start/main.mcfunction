#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/main
#
# アニメーションイベントハンドラ 滑空突進開始
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_flytackle_start.frame matches 1..38 run tag @n[tag=Mns.Target.Valk] add Temp.Rotate.Target
    execute if score @s aj.lance_flytackle_start.frame matches 1..38 run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.lance_flytackle_start.frame matches 1..12 if entity @n[tag=Mns.Target.Valk,distance=..15] at @s run tp @s ^ ^ ^-0.8

# 効果音
    execute if score @s aj.lance_flytackle_start.frame matches 14..15 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.1 0.4
    execute if score @s aj.lance_flytackle_start.frame matches 14..15 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.9 0.4
    execute if score @s aj.lance_flytackle_start.frame matches 14..15 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.lance_flytackle_start.frame matches 14 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.lance_flytackle_start.frame matches 14 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    
    execute if score @s aj.lance_flytackle_start.frame matches 14 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_flytackle_start.frame matches 22 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

    execute if score @s aj.lance_flytackle_start.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_flytackle_start.frame matches 45 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_flytackle_start.frame matches 45 run playsound entity.breeze.jump master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_flytackle_start.frame matches 45 run playsound entity.breeze.jump master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6
    execute if score @s aj.lance_flytackle_start.frame matches 43 run playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_flytackle_start.frame matches 43 run playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6

    execute if score @s aj.lance_flytackle_start.frame matches 2..42 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/particle
    execute if score @s aj.lance_flytackle_start.frame matches 43 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/particle_launch

# 移動位置決定
    execute if score @s aj.lance_flytackle_start.frame matches 38 positioned as @n[tag=Mns.Target.Valk] rotated ~ 0 positioned ^ ^0.5 ^ run summon area_effect_cloud ^ ^ ^ {Duration:200,DurationOnUse:0,Tags:["Mns.MovePos.Valk"]}
    execute if score @s aj.lance_flytackle_start.frame matches 38 as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] at @s run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.lance_flytackle_start.frame matches 38 as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] at @s run tp @s ~ ~0.5 ~
    execute if score @s aj.lance_flytackle_start.frame matches 38 as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] positioned as @s if block ^ ^ ^5 #mhdp_core:no_collision run tp @s ^ ^ ^5
    execute if score @s aj.lance_flytackle_start.frame matches 38 if score @s Mns.Valk.JetCount matches 2.. as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] positioned as @s if block ^ ^ ^3 #mhdp_core:no_collision run tp @s ^ ^ ^3
    execute if score @s aj.lance_flytackle_start.frame matches 38 if score @s Mns.Valk.JetCount matches 2.. as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] positioned as @s if block ^ ^ ^3 #mhdp_core:no_collision run tp @s ^ ^ ^3

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_flytackle_start.frame matches 46 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/end
