#> mhdp_items:weapons/short_sword/type_tec/15_just_3/attack_1
#
# ジャストラッシュ2 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/15_just_3/change_to_chargeattack

# 命中判定
    execute anchored eyes positioned ^ ^ ^1 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^2 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^3 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^4 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒットストップ    
    execute if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 1

# 攻撃
    execute if entity @s[tag=!Ply.Flag.Just.Success] run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Just.3
    execute if entity @s[tag=Ply.Flag.Just.Success] run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Just.3.S
    execute if entity @e[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
