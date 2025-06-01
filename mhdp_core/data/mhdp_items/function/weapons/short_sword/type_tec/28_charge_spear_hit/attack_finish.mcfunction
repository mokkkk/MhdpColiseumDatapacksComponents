#> mhdp_items:weapons/short_sword/type_tec/28_charge_spear_hit/attack_finish
#
# 溜め斬り落とし 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# ターゲット決定
    scoreboard players operation #mhdo_temp_uuid MhdpCore = @s Ply.Other.AttackTargetUuid
    execute as @e[tag=Mns.HitBox,distance=..10] if score @s Entity.Uuid = #mhdo_temp_uuid MhdpCore run tag @s add Temp.Victim

# 攻撃
    data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.ChargeSpear.Hit.Finish
    execute if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    tag @e[type=slime,tag=Temp.Hit] remove Temp.Hit
    scoreboard players reset #mhdo_temp_uuid MhdpCore
