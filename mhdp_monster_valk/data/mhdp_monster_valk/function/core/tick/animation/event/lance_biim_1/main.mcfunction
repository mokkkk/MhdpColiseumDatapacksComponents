#> mhdp_monster_valk:core/tick/animation/event/lance_biim_1/main
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_biim_1.frame matches 1..52 run tag @n[tag=Mns.Target.Valk] add Temp.Rotate.Target
    execute if score @s aj.lance_biim_1.frame matches 1..52 run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 効果音
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

# 演出
    execute if score @s aj.lance_biim_1.frame matches 2..63 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/particle_1
    execute if score @s aj.lance_biim_1.frame matches 43..63 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/particle_2
    execute if score @s aj.lance_biim_1.frame matches 43 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/thunder_start
    execute if score @s aj.lance_biim_1.frame matches 44..63 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/thunder_tick
    execute if score @s aj.lance_biim_1.frame matches 64 run kill @e[type=text_display,tag=Mns.Shot.Valk.Vfx.RedFlash.Long]

# モデル演出
    execute if score @s aj.lance_biim_1.frame matches 2 run function mhdp_monster_valk:core/util/models/ignite_start

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_biim_1.frame matches 64 run function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/end
