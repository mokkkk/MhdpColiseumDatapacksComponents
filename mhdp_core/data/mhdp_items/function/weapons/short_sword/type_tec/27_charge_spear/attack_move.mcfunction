#> mhdp_items:weapons/short_sword/type_tec/27_charge_spear/attack_move
#
# 溜め斬り落とし 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 命中判定
    execute anchored eyes positioned ^ ^ ^1 positioned ~-0.75 ~-0.75 ~-0.75 run tag @e[type=slime,tag=Mns.HitBox,dx=1.5,dy=1.5,dz=1.5] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^3 positioned ~-0.75 ~-0.75 ~-0.75 run tag @e[type=slime,tag=Mns.HitBox,dx=1.5,dy=1.5,dz=1.5] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒット判定
    execute if entity @n[tag=Temp.Victim] run tag @s add Ply.Flag.Hit

# 攻撃
    data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.ChargeSpear.Move
    execute if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    tag @e[type=slime,tag=Temp.Hit] remove Temp.Hit
