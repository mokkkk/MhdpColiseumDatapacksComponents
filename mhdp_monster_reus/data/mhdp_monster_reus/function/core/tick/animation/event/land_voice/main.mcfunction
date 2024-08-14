#> mhdp_monster_reus:core/tick/animation/event/land_voice/main
#
# アニメーションイベントハンドラ 咆哮
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 演出
    execute if score @s aj.land_voice.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.land_voice.frame matches 17 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_voice.frame matches 25 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_voice.frame matches 44..74 on passengers if entity @s[tag=aj.data] run function mhdp_monster_reus:core/tick/animation/event/land_voice/effect_voice with entity @s data.locators.pos_head
    execute if score @s aj.land_voice.frame matches 25 run playsound entity.hoglin.angry master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_voice.frame matches 44..60 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound entity.ender_dragon.growl master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.land_voice.frame matches 44..60 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound entity.ravager.attack master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.land_voice.frame matches 44..70 run particle block{block_state:"minecraft:sand"} ^ ^ ^5 2 0.1 2 0 10

# 咆哮怯み
    execute if score @s aj.land_voice.frame matches 44 run data modify storage mhdp_core:temp Damage set value {VoiceValue:2,VoiceTime:40,GuardValue:6}
    execute if score @s aj.land_voice.frame matches 44 as @a[tag=Ply.State.EnableDamage,distance=..18] facing entity @s feet positioned as @s run function mhdp_core:player/damage/voice/main
    execute if score @s aj.land_voice.frame matches 44 run data remove storage mhdp_core:temp Damage

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_voice.frame matches 97 run function mhdp_monster_reus:core/tick/animation/event/land_voice/end
