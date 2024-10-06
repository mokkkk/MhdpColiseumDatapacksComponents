#> mhdp_monster_valk:core/tick/animation/event/lance_bite/attack_l
#
# アニメーションイベントハンドラ 2連突き
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"Bomb.Side"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ヒット確認
    # 対プレイヤー
        execute positioned ^6 ^1 ^-1 as @a[tag=Ply.State.EnableDamage,distance=..5.5] run tag @s add Temp.Hit
        execute positioned ^-6 ^1 ^-1 as @a[tag=Ply.State.EnableDamage,distance=..5.5] run tag @s add Temp.Hit
        execute positioned ^6 ^1 ^3 as @a[tag=Ply.State.EnableDamage,distance=..5.5] run tag @s add Temp.Hit
        execute positioned ^-6 ^1 ^3 as @a[tag=Ply.State.EnableDamage,distance=..5.5] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        execute if entity @a[tag=Mns.Target.Dino,tag=Temp.Hit] run tag @s add Mns.Temp.IsHit
        tag @a remove Temp.Hit
    # 対モンスター
        execute positioned ^ ^1 ^4 as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..3.8] run tag @s add Temp.Hit
        execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 演出
    particle dust{color:[1.000,0.112,0.312],scale:3} ^6 ^6 ^1 0.8 0.8 0.8 0.15 13
    particle dust{color:[1.000,0.112,0.312],scale:3} ^6 ^3 ^1 0.8 0.8 0.8 0.15 13
    particle dust{color:[1.000,0.112,0.312],scale:3} ^-6 ^6 ^1 0.8 0.8 0.8 0.15 13
    particle dust{color:[1.000,0.112,0.312],scale:3} ^-6 ^3 ^1 0.8 0.8 0.8 0.15 13
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    particle explosion_emitter ^6 ^1 ^2 0.3 0.3 0.3 0 1
    particle explosion_emitter ^-6 ^1 ^2 0.3 0.3 0.3 0 1
    particle explosion_emitter ^6 ^1 ^-2 0.3 0.3 0.3 0 1
    particle explosion_emitter ^-6 ^1 ^-2 0.3 0.3 0.3 0 1
    particle gust_emitter_large ^6 ^1 ^1 0.3 0.3 0.3 0 3
    particle gust_emitter_large ^-6 ^1 ^1 0.3 0.3 0.3 0 3
    playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    playsound entity.shulker.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    playsound entity.shulker.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
