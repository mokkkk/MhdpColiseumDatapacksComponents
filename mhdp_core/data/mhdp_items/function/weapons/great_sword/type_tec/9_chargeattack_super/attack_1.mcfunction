#> mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/attack_1
#
# 真溜め斬り 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_Super/main

# 命中判定
    execute anchored eyes positioned ^ ^ ^1 run tag @e[type=slime,tag=Mns.HitBox,distance=..1.5] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^2 run tag @e[type=slime,tag=Mns.HitBox,distance=..1.5] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^3 run tag @e[type=slime,tag=Mns.HitBox,distance=..1.5] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^4 run tag @e[type=slime,tag=Mns.HitBox,distance=..1.5] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒットストップ
    execute if entity @e[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 7
    execute if entity @e[tag=Temp.Victim] run tp @s @s
    
# 攻撃
    execute if score @s Wpn.Gs.ChargeCount matches ..1 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.Super.1
    execute if score @s Wpn.Gs.ChargeCount matches 2 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.Super.2
    execute if score @s Wpn.Gs.ChargeCount matches 3.. run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.ChargeSlash.Super.3
    execute if entity @e[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
