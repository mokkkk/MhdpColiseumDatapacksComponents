#> mhdp_items:weapons/short_sword/type_tec/1_spear_1/attack
#
# 居合抜刀気刃斬り 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 命中判定
    execute rotated ~ 0 run function api:bounding/cylinder.m {Selector:"@e[type=slime,tag=Mns.HitBox]",Tag:"Temp.Hit",Radius:7.0,Height:6.0}

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒットストップ    
    execute if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 1

# 攻撃
    execute if score @s Wpn.Ls.SpiritLevel matches ..1 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.LongSword.Tec.IaiSpiritSlash.1
    execute if score @s Wpn.Ls.SpiritLevel matches 2 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.LongSword.Tec.IaiSpiritSlash.2
    execute if score @s Wpn.Ls.SpiritLevel matches 3.. run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.LongSword.Tec.IaiSpiritSlash.3
    execute if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    tag @e[type=slime,tag=Temp.Hit] remove Temp.Hit
