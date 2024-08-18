#> mhdp_items:weapons/great_sword/type_tec/9_chargeattack_super/attack_0
#
# 真溜め斬り 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/7_chargeattack_high/main

# 命中判定
    execute anchored eyes positioned ^ ^ ^1 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^2 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^3 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒットストップ
    execute if entity @e[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 3
    execute if entity @e[tag=Temp.Victim] run tag @s add Ply.Flag.Hit

# 攻撃
    data modify storage mhdp_core:temp Damage set value {AttackType:Cut,DamageMult:20,PartDamageMult:10,ElementDamageMult:60,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.02,IsVfxStrong:false,VfxScale:[3f,4f,3f]}
    execute if entity @e[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
