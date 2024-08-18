#> mhdp_items:weapons/short_sword/type_tec/16_just_4/attack_1
#
# 駆け上がり斬り 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/16_just_4/change_to_chargeattack

# 命中判定
    execute anchored eyes positioned ^ ^ ^1 positioned ~-0.7 ~-0.7 ~-0.7 run tag @e[type=slime,tag=Mns.HitBox,dx=1.4,dy=1.4,dz=1.4] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒットストップ    
    execute if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 1

# 攻撃
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.JumpSlash
    execute if entity @e[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
