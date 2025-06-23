#> mhdp_items:weapons/short_sword/type_tec/30_upper_bash/attack_1
#
# 滅・昇竜撃 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/30_upper_bash/change_to_chargeattack

# 命中判定
    execute anchored eyes positioned ^ ^ ^1 positioned ~-1.5 ~-1.5 ~-1.5 run tag @e[type=slime,tag=Mns.HitBox,dx=3,dy=3,dz=3] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒット判定
    execute if entity @n[tag=Temp.Victim] run tag @s add Ply.Flag.Hit
    execute if entity @s[tag=Ply.Flag.Hit] run scoreboard players operation @s Ply.Other.AttackTargetUuid = @n[tag=Temp.Victim] Entity.Uuid

# ヒットストップ    
    execute if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 1

# 攻撃
    data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.UpperBash
    execute if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    tag @e[type=slime,tag=Temp.Hit] remove Temp.Hit
