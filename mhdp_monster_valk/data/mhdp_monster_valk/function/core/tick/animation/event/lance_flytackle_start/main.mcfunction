#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/main
#
# アニメーションイベントハンドラ 滑空突進開始
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_flytackle_start.frame matches 1..36 at @s run tag @n[tag=Mns.Target.Valk] add Temp.Rotate.Target
    execute if score @s aj.lance_flytackle_start.frame matches 1..36 at @s run function mhdp_monsters:core/util/tick/event/turn_to_target_accurate

# 移動
    execute if score @s aj.lance_flytackle_start.frame matches 1..12 if entity @n[tag=Mns.Target.Valk,distance=..18] at @s run tp @s ^ ^ ^-0.8

# 効果音
    execute if score @s aj.lance_flytackle_start.frame matches 14..15 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.1 0.4
    execute if score @s aj.lance_flytackle_start.frame matches 14..15 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.9 0.4
    execute if score @s aj.lance_flytackle_start.frame matches 14..15 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.lance_flytackle_start.frame matches 14 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.lance_flytackle_start.frame matches 14 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4

    execute if score @s aj.lance_flytackle_start.frame matches 14..17 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

    execute if score @s aj.lance_flytackle_start.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_flytackle_start.frame matches 45 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_flytackle_start.frame matches 45 run playsound entity.breeze.jump master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_flytackle_start.frame matches 45 run playsound entity.breeze.jump master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6
    execute if score @s aj.lance_flytackle_start.frame matches 43 run playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_flytackle_start.frame matches 43 run playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6

    execute if score @s aj.lance_flytackle_start.frame matches 2..42 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/particle
    execute if score @s aj.lance_flytackle_start.frame matches 43 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/particle_launch

# 演出
    execute if score @s aj.lance_flytackle_start.frame matches 45 run data modify storage api: Arg.Override set value {IsLong:true,IsFollow:true,Scale:12}
    execute if score @s aj.lance_flytackle_start.frame matches 45 positioned ^-1 ^3 ^ run function api:object/summon.m {ObjectId:10047}
    execute if score @s aj.lance_flytackle_start.frame matches 45.. run tp @n[type=text_display,tag=10047.IsFollow] ^ ^3 ^

# 移動位置決定
    execute if score @s aj.lance_flytackle_start.frame matches 38 positioned as @n[tag=Mns.Target.Valk] rotated ~ 0 positioned ^ ^0.5 ^ run summon area_effect_cloud ^ ^ ^ {Duration:200,DurationOnUse:0,Tags:["Mns.MovePos.Valk"]}
    execute if score @s aj.lance_flytackle_start.frame matches 38 as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] at @s run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.lance_flytackle_start.frame matches 38 as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] at @s run tp @s ~ ~0.5 ~
    execute if score @s aj.lance_flytackle_start.frame matches 38 as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] positioned as @s if block ^ ^ ^5 #mhdp_core:no_collision run tp @s ^ ^ ^5
    execute if score @s aj.lance_flytackle_start.frame matches 38 if score @s Mns.Valk.JetCount matches 2.. as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] positioned as @s if block ^ ^ ^3 #mhdp_core:no_collision run tp @s ^ ^ ^3
    execute if score @s aj.lance_flytackle_start.frame matches 38 if score @s Mns.Valk.JetCount matches 2.. as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] positioned as @s if block ^ ^ ^3 #mhdp_core:no_collision run tp @s ^ ^ ^3

# モデル演出
    execute if score @s aj.lance_flytackle_start.frame matches 5 run function mhdp_monster_valk:core/util/models/ignite_start

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 状態
    execute if score @s aj.lance_flytackle_start.frame matches 43 run tag @s add Mns.State.IsFlying

# 終了
    execute if score @s aj.lance_flytackle_start.frame matches 46 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_start/end
