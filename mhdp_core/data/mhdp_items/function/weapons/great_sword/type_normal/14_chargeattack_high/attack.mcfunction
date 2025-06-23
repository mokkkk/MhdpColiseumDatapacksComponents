#> mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/attack
#
# 溜め斬り 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/main

# 命中判定
    execute anchored eyes positioned ^ ^ ^1 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^2 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^3 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^4 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^5 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒットストップ
    execute if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 5
    execute if entity @n[tag=Temp.Victim] run tp @s @s

# 攻撃
    execute if score @s Wpn.Gs.ChargeCount matches ..1 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Normal.ChargePower.1
    execute if score @s Wpn.Gs.ChargeCount matches 2 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Normal.ChargePower.2
    execute if score @s Wpn.Gs.ChargeCount matches 3.. run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Normal.ChargePower.3
    execute if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
