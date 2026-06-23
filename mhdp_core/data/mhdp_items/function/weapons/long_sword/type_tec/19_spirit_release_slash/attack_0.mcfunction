#> mhdp_items:weapons/short_sword/type_tec/1_spear_1/attack
#
# 突き1 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 命中判定
    execute anchored eyes positioned ^ ^ ^1 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^2 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^3 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^4 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^5 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒットストップ    
    execute if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 1

# 攻撃
    data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.LongSword.Tec.SpiritRelease.1
    execute if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 演出用VFXオブジェクト召喚
    # データ設定
        data modify storage api: Arg.Override.Tag set value "slash_strong"
        data modify storage api: Arg.Override.IsCounter set value false
        data modify storage api: Arg.Override.Rotation set value -1.39626
        data modify storage api: Arg.Override.Scale set value [3f,12f,3f]
    # 召喚
        execute positioned ~ ~1.65 ~ positioned ^-1.3 ^0.2 ^3.5 facing entity @s eyes run function api:object/summon.m {ObjectId:7}
    # データ設定
        data modify storage api: Arg.Override.Tag set value "slash_strong"
        data modify storage api: Arg.Override.IsCounter set value false
        data modify storage api: Arg.Override.Rotation set value -2.19626
        data modify storage api: Arg.Override.Scale set value [3f,12f,3f]
    # 召喚
        execute positioned ~ ~1.65 ~ positioned ^1.4 ^-0.2 ^3.5 facing entity @s eyes run function api:object/summon.m {ObjectId:7}

# 終了
    tag @e[type=slime,tag=Temp.Hit] remove Temp.Hit
