#> mhdp_monster_valk:core/tick/animation/event/shoot_sault/attack
#
# アニメーションイベントハンドラ 前方爆発
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"Bomb.Side"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ヒット確認
    # 対プレイヤー
        execute positioned ^ ^ ^3 as @a[tag=Ply.State.EnableDamage,distance=..6.2] run tag @s add Temp.Hit
        execute positioned ^5 ^ ^3 as @a[tag=Ply.State.EnableDamage,distance=..6.2] run tag @s add Temp.Hit
        execute positioned ^-5 ^ ^3 as @a[tag=Ply.State.EnableDamage,distance=..6.2] run tag @s add Temp.Hit
        execute positioned ^10 ^ ^3 as @a[tag=Ply.State.EnableDamage,distance=..6.2] run tag @s add Temp.Hit
        execute positioned ^-10 ^ ^3 as @a[tag=Ply.State.EnableDamage,distance=..6.2] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        execute if entity @a[tag=Mns.Target.Dino,tag=Temp.Hit] run tag @s add Mns.Temp.IsHit
        tag @a remove Temp.Hit
    # 対モンスター
        execute positioned ^ ^ ^3 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..6.2] run tag @s add Temp.Hit
        execute positioned ^5 ^ ^3 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..6.2] run tag @s add Temp.Hit
        execute positioned ^-5 ^ ^3 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..6.2] run tag @s add Temp.Hit
        execute positioned ^10 ^ ^3 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..6.2] run tag @s add Temp.Hit
        execute positioned ^-10 ^ ^13 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..6.2] run tag @s add Temp.Hit
        execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 演出
    # particle dust{color:[1.000,0.000,0.152],scale:3} ^6 ^1 ^3 0.8 0.8 0.8 0.15 13
    # particle dust{color:[1.000,0.000,0.152],scale:3} ^ ^1 ^3 0.8 0.8 0.8 0.15 13
    # particle dust{color:[1.000,0.000,0.152],scale:3} ^-6 ^1 ^3 0.8 0.8 0.8 0.15 13
    # particle dust{color:[1.000,0.000,0.152],scale:3} ^11 ^1 ^3 0.8 0.8 0.8 0.15 13
    # particle dust{color:[1.000,0.000,0.152],scale:3} ^-11 ^1 ^3 0.8 0.8 0.8 0.15 13
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    # particle explosion_emitter ^5 ^1 ^3 0.3 0.3 0.3 0 1
    # particle explosion_emitter ^ ^1 ^3 0.3 0.3 0.3 0 1
    # particle explosion_emitter ^-5 ^1 ^3 0.3 0.3 0.3 0 1
    # particle explosion_emitter ^10 ^1 ^3 0.3 0.3 0.3 0 1
    # particle explosion_emitter ^-10 ^1 ^3 0.3 0.3 0.3 0 1
    # particle gust_emitter_large ^5 ^1 ^3 0.3 0.3 0.3 0 1
    # particle gust_emitter_large ^ ^1 ^3 0.3 0.3 0.3 0 1
    # particle gust_emitter_large ^-5 ^1 ^3 0.3 0.3 0.3 0 1
    # particle gust_emitter_large ^10 ^1 ^3 0.3 0.3 0.3 0 1
    # particle gust_emitter_large ^-10 ^1 ^3 0.3 0.3 0.3 0 1
    playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    playsound entity.shulker.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    playsound entity.shulker.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    particle explosion ^-10 ^1 ^3 1.8 1.8 1.8 0 8
    particle explosion ^-5 ^1 ^3 1.8 1.8 1.8 0 8
    particle explosion ^ ^1 ^3 1.8 1.8 1.8 0 8
    particle explosion ^5 ^1 ^3 1.8 1.8 1.8 0 8
    particle explosion ^10 ^1 ^3 1.8 1.8 1.8 0 8
    summon text_display ^-10 ^1.2 ^2.7 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Bomb"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[7f,7f,7f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,billboard:"center",alignment:"left"}
    summon text_display ^-5 ^1.2 ^3 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Bomb"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[7.5f,7.5f,7.5f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,billboard:"center",alignment:"left"}
    summon text_display ^ ^1.2 ^3.1 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Bomb"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[7f,7f,7f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,billboard:"center",alignment:"left"}
    summon text_display ^5 ^1.2 ^2.9 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Bomb"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[7.2f,7.2f,7.2f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,billboard:"center",alignment:"left"}
    summon text_display ^10 ^1.2 ^3 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Bomb"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[7.5f,7.5f,7.5f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,billboard:"center",alignment:"left"}
    particle large_smoke ^-10 ^1 ^3 1.8 1.8 1.8 0.1 8
    particle large_smoke ^-5 ^1 ^3 1.8 1.8 1.8 0.1 8
    particle large_smoke ^ ^1 ^3 1.8 1.8 1.8 0.1 8
    particle large_smoke ^5 ^1 ^3 1.8 1.8 1.8 0.1 8
    particle large_smoke ^10 ^1 ^3 1.8 1.8 1.8 0.1 8

    summon text_display ^-10 ^1 ^3 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    summon text_display ^-5 ^1 ^3 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    summon text_display ^0 ^1 ^3 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    summon text_display ^5 ^1 ^3 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    summon text_display ^10 ^1 ^3 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[8f,8f,8f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
