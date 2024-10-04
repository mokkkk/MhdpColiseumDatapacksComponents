#> mhdp_items:weapons/great_sword/type_tec/14_upper_slash/attack
#
# 相殺斬り上げ 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# デバッグ
    # tag @s add Ply.Flag.Counter

# 命中判定
    execute anchored eyes positioned ^ ^ ^1 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^2 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^3 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^4 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^5 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ターゲットがいない場合、カウンター失敗
    execute unless entity @n[tag=Temp.Victim] run tag @s remove Ply.Flag.Counter

# ヒットストップ    
    execute if score @s Wpn.Gs.ChargeCount matches ..1 if entity @e[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 3
    execute if score @s Wpn.Gs.ChargeCount matches 2.. if entity @e[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 5
    execute if entity @s[tag=Ply.Flag.Counter] if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 7
    execute if entity @e[tag=Temp.Victim] run tp @s @s

# 演出
    execute if entity @s[tag=Ply.Flag.Counter] if entity @n[tag=Temp.Victim] run playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
    execute if entity @s[tag=Ply.Flag.Counter] if entity @n[tag=Temp.Victim] run playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
    execute if entity @s[tag=Ply.Flag.Counter] if entity @n[tag=Temp.Victim] run playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.2
    execute if entity @s[tag=Ply.Flag.Counter] if entity @n[tag=Temp.Victim] run playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.2
    execute if entity @s[tag=Ply.Flag.Counter] if entity @n[tag=Temp.Victim] anchored eyes run particle firework ^ ^ ^1 0 0 0 0.4 20
    execute if entity @s[tag=Ply.Flag.Counter] if entity @n[tag=Temp.Victim] anchored eyes run particle crit ^ ^ ^1 0 0 0 1 50

    # execute if entity @s[tag=Ply.Flag.Counter] run tp @s @s
    # execute if entity @s[tag=Ply.Flag.Counter] run scoreboard players set $strength delta.api.launch 8000
    # execute if entity @s[tag=Ply.Flag.Counter] rotated ~180 -30 run function delta:api/launch_looking

# 攻撃
    execute if score @s Wpn.Gs.ChargeCount matches ..1 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.Upper.1
    execute if score @s Wpn.Gs.ChargeCount matches 2 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.Upper.2
    execute if score @s Wpn.Gs.ChargeCount matches 3.. run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.Upper.3
    execute if entity @e[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
