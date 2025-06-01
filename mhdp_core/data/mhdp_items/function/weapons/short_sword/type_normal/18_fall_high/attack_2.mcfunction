#> mhdp_items:weapons/short_sword/type_normal/18_fall_high/attack_2
#
# 駆け上がり斬り 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_normal/16_just_4/change_to_chargeattack

# 命中判定
    execute anchored eyes positioned ^ ^ ^ run tag @e[type=slime,tag=Mns.HitBox,distance=..3.5] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒットストップ    
    execute if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 1

# 演出
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 攻撃
    data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.ShortSword.Normal.Fall.High.2
    execute if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    tag @e[type=slime,tag=Temp.Hit] remove Temp.Hit
