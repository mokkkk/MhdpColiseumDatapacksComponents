#> mhdp_monster_valk:core/tick/animation/event/lance_biim_1/main
#
# アニメーションイベントハンドラ 龍閃 (溜め)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_biim_1.frame matches 1..52 at @s run tag @n[tag=Mns.Target.Valk] add Temp.Rotate.Target
    execute if score @s aj.lance_biim_1.frame matches 1..52 at @s run function mhdp_monsters:core/util/tick/event/turn_to_target_accurate

# 効果音
    execute if score @s aj.lance_biim_1.frame matches 1..8 if entity @n[tag=Mns.Target.Valk,distance=..15] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.lance_biim_1.frame matches 2..10 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.7 0.3
    execute if score @s aj.lance_biim_1.frame matches 2..10 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.8 0.3
    execute if score @s aj.lance_biim_1.frame matches 11..20 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.9 0.3
    execute if score @s aj.lance_biim_1.frame matches 11..20 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 2 0.3
    execute if score @s aj.lance_biim_1.frame matches 2..25 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 2 0.3
    execute if score @s aj.lance_biim_1.frame matches 2..25 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 1.8 0.3
    execute if score @s aj.lance_biim_1.frame matches 2..10 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.9
    execute if score @s aj.lance_biim_1.frame matches 11..20 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 2
    execute if score @s aj.lance_biim_1.frame matches 37 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_biim_1.frame matches 37 run particle block{block_state:"minecraft:sand"} ^ ^ ^3 2 0.1 2 0 30
    execute if score @s aj.lance_biim_1.frame matches 33..48 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound entity.warden.sonic_charge master @s ^ ^1 ^5 0.5 1.7 0.4
    execute if score @s aj.lance_biim_1.frame matches 49..55 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound entity.warden.sonic_charge master @s ^ ^1 ^5 0.5 2 0.4

# 演出
    execute if score @s aj.lance_biim_1.frame matches 2..63 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/particle_1
    execute if score @s aj.lance_biim_1.frame matches 43..63 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/particle_2

    # Object: Thunder (10048)
        execute if score @s aj.lance_biim_1.frame matches 6 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/thunder_start
        execute if score @s aj.lance_biim_1.frame matches 6..63 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/thunder_tick

    # Object: Jet (10047, IsBeamVfx)
        execute if score @s aj.lance_biim_1.frame matches 43 run data modify storage api: Arg.Override set value {IsBeamVfx:true,IsFollow:true,Scale:2}
        execute if score @s aj.lance_biim_1.frame matches 43 positioned ^ ^2 ^8 run function api:object/summon.m {ObjectId:10047}
        execute if score @s aj.lance_biim_1.frame matches 44..63 run tp @n[type=text_display,tag=10047.IsFollow] ^ ^2 ^8

# モデル演出
    execute if score @s aj.lance_biim_1.frame matches 2 run function mhdp_monster_valk:core/util/models/ignite_start

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_biim_1.frame matches 64 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/end
