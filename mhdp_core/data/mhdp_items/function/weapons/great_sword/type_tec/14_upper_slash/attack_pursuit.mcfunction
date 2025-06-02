#> mhdp_items:weapons/great_sword/type_tec/14_upper_slash/attack_pursuit
#
# 相殺斬り上げ 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# ターゲット決定
    scoreboard players operation #mhdo_temp_uuid MhdpCore = @s Ply.Other.AttackTargetUuid
    execute as @e[tag=Mns.HitBox,distance=..10] if score @s Entity.Uuid = #mhdo_temp_uuid MhdpCore run tag @s add Temp.Victim

# 攻撃
    execute if score @s Wpn.Gs.ChargeCount matches ..1 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.Upper.Pursuit.1
    execute if score @s Wpn.Gs.ChargeCount matches 2 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.Upper.Pursuit.2
    execute if score @s Wpn.Gs.ChargeCount matches 3.. run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.Upper.Pursuit.3
    execute if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
