#> mhdp_items:weapons/short_sword/type_tec/1_normal_1/attack
#
# 溜め斬り 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 命中判定
    execute anchored eyes positioned ^ ^ ^1 run tag @e[type=slime,tag=Mns.HitBox,distance=..1.5] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^2 run tag @e[type=slime,tag=Mns.HitBox,distance=..1.5] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^3 run tag @e[type=slime,tag=Mns.HitBox,distance=..1.5] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒットストップ    
    execute if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 1

# ヒット判定
    execute if entity @n[tag=Temp.Victim] run tag @s add Ply.Flag.Hit
    execute if entity @s[tag=Ply.Flag.Hit] run scoreboard players operation @s Ply.Other.AttackTargetUuid = @n[tag=Temp.Victim] Entity.Uuid

# 攻撃
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.ChargeSlash
    execute if entity @e[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit