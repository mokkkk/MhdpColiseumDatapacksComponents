#> mhdp_items:weapons/short_sword/type_tec/31_blade_dance/attack_0
#
# ブレイドダンス 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/31_blade_dance/change_to_chargeattack

# 命中判定
    execute anchored eyes positioned ^ ^ ^1 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^2 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^3 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^4 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒットストップ    
    # execute if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 1

# 攻撃
    data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.BladeDance.7
    execute if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 演出
    playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/16_just_4/particle_1
    execute positioned ~ ~1.65 ~ positioned ^ ^ ^1.5 run function mhdp_items:weapons/short_sword/type_tec/16_just_4/particle_1

# 終了
    tag @e[type=slime,tag=Temp.Hit] remove Temp.Hit
