#> mhdp_monster_valk:core/tick/animation/event/lance_voice/main
#
# アニメーションイベントハンドラ 咆哮
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_voice.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_voice.frame matches 44..80 run particle block{block_state:"minecraft:sand"} ^ ^ ^5 2 0.1 2 0 10

    execute if score @s aj.lance_voice.frame matches 44..55 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 1.8 0.4
    execute if score @s aj.lance_voice.frame matches 44..55 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 2 0.4
    execute if score @s aj.lance_voice.frame matches 56..85 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 1.3 0.4
    execute if score @s aj.lance_voice.frame matches 56..85 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.lance_voice.frame matches 44..53 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1 0.4
    execute if score @s aj.lance_voice.frame matches 44..53 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_voice.frame matches 54..65 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.lance_voice.frame matches 54..65 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.6 0.4
    execute if score @s aj.lance_voice.frame matches 66..85 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 2 0.4
    execute if score @s aj.lance_voice.frame matches 66..85 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.6 0.4
    execute if score @s aj.lance_voice.frame matches 44..65 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound entity.warden.death master @s ^ ^1 ^1 0.5 0.75 0.5
    execute if score @s aj.lance_voice.frame matches 44..45 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound entity.warden.sonic_boom master @s ^ ^1 ^1 0.5 0.9 0.5
    execute if score @s aj.lance_voice.frame matches 44..45 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound entity.warden.sonic_boom master @s ^ ^1 ^1 0.5 0.75 0.5
    execute if score @s aj.lance_voice.frame matches 39..85 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/lance_voice/m.particle_head with entity @s data.locators.pos_head

# 咆哮怯み
    execute if score @s aj.lance_voice.frame matches 40 run data modify storage mhdp_core:temp Damage set value {VoiceValue:2,VoiceTime:40,GuardValue:6}
    execute if score @s aj.lance_voice.frame matches 40 as @a[tag=Ply.State.EnableDamage,distance=..18] facing entity @s feet positioned as @s run function mhdp_core:player/damage/voice/main
    execute if score @s aj.lance_voice.frame matches 40 run data remove storage mhdp_core:temp Damage

# モデル演出
    execute if score @s aj.lance_voice.frame matches 38 run function mhdp_monster_valk:core/util/models/chest_glow_start
    execute if score @s aj.lance_voice.frame matches 80 run function mhdp_monster_valk:core/util/models/chest_glow_end

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_voice.frame matches 114 run function mhdp_monster_valk:core/tick/animation/event/lance_voice/end
