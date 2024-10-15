#> mhdp_monster_valk:core/tick/animation/event/lance_upper_l/attack_sub
#
# アニメーションイベントハンドラ 翼槍叩きつけ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# ヒット確認
    # 対プレイヤー
        execute as @a[tag=Ply.State.EnableDamage,distance=..3.4] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit
    # 対モンスター
        execute as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..3.4] run tag @s add Temp.Hit
        execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 演出
    particle dust{color:[1.000,0.000,0.152],scale:4} ^ ^0.3 ^ 1 1 1 0.15 5
    summon text_display ^ ^0.7 ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Bomb"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[7f,7f,7f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,billboard:"center",alignment:"left"}
    particle explosion ^ ^1 ^ 1.2 1.2 1.2 0 8
    summon text_display ^ ^1 ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[6f,6f,6f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
