#> mhdp_monster_dino:core/tick/animation/event/voice/main
#
# アニメーションイベントハンドラ 咆哮
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.voice.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.voice.frame matches 10 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.voice.frame matches 10 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.voice.frame matches 10 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.voice.frame matches 22 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.voice.frame matches 22 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.voice.frame matches 22 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.voice.frame matches 97 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.voice.frame matches 97 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.voice.frame matches 97 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.voice.frame matches 37..47 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.voice.frame matches 44..80 run particle block{block_state:"minecraft:sand"} ^ ^ ^8 2 0.1 2 0 10

    execute if score @s aj.voice.frame matches 30 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.angry master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

    execute if score @s aj.voice.frame matches 44..80 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.voice.frame matches 44..80 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.voice.frame matches 44..80 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.voice.frame matches 44..65 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_air master @s ^ ^1 ^1 0.6 0.8 0.6
    execute if score @s aj.voice.frame matches 44..45 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground_heavy master @s ^ ^1 ^1 0.6 0.6 0.6
    execute if score @s aj.voice.frame matches 44..45 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground_heavy master @s ^ ^1 ^1 0.6 0.5 0.6

    execute if score @s aj.voice.frame matches 11 run function mhdp_monster_dino:core/tick/animation/event/voice/particle_tail
    execute if score @s aj.voice.frame matches 37..47 run function mhdp_monster_dino:core/tick/animation/event/voice/particle_tail
    execute if score @s aj.voice.frame matches 44..80 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/voice/m.particle_head with entity @s data.locators.pos_head

# 咆哮怯み
    execute if score @s aj.voice.frame matches 44 run data modify storage mhdp_core:temp Damage set value {VoiceValue:2,VoiceTime:40,GuardValue:6}
    execute if score @s aj.voice.frame matches 44 as @a[tag=Ply.State.EnableDamage,distance=..18] facing entity @s feet positioned as @s run function mhdp_core:player/damage/voice/main
    execute if score @s aj.voice.frame matches 44 run data remove storage mhdp_core:temp Damage

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.voice.frame matches 109 run function mhdp_monster_dino:core/tick/animation/event/voice/end