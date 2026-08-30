#> mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/attack
#
# アニメーションイベントハンドラ 翼槍叩きつけ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# データ読み込み
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:monster_data AttackData[{Uid:1004}].Attacks[{Name:"Vertical"}]
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players set #mhdp_temp_attack_multiply_anger MhdpCore 100
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players operation #mhdp_temp_attack_multiply_anger MhdpCore = @s Mns.Anger.AttackMutiply

# ヒット確認
    # 対プレイヤー
        execute as @a[tag=Ply.State.EnableDamage,distance=..4.0] run tag @s add Temp.Hit
        execute as @a[tag=Temp.Hit] run function mhdp_core:player/damage/entity_to_player/main
        tag @a remove Temp.Hit
    # 対モンスター
        execute as @e[type=slime,tag=Mns.HitBox,tag=!Mns.HitBox.DisableMnsDamage,tag=!Mns.HitBox.Valk,distance=..4.0] run tag @s add Temp.Hit
        execute if entity @n[tag=Temp.Hit] as @n[tag=Temp.Hit] run tag @s add Temp.Victim
        execute if entity @n[tag=Temp.Victim] as @n[tag=Temp.Victim] run function mhdp_core:player/damage/entity_to_entity/main

# 演出
    particle explosion ~ ~ ~ 1 0.1 1 0 10
    execute at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound entity.wither.break_block master @s ^ ^1 ^1 0.4 0.8 0.4
    playsound item.mace.smash_ground master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound item.mace.smash_ground master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute positioned ^0.5 ^-3 ^0.3 facing entity @e[type=marker,tag=Mk.Field.Back,sort=random,limit=1] feet rotated ~ 0 run function mhdp_monsters:core/effect/crack_ground/start
    execute positioned ^-0.5 ^-3 ^0.3 facing entity @e[type=marker,tag=Mk.Field.Back,sort=random,limit=1] feet rotated ~ 0 run function mhdp_monsters:core/effect/crack_ground/start
    execute positioned ^ ^1 ^ rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l_to_r/particle_ring
    
# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
    data remove storage mhdp_core:temp Damage
    scoreboard players reset #mhdp_temp_attack_multiply_anger MhdpCore
