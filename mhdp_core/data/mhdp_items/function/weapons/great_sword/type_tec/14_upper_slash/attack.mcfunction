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

# ヒットストップ
    execute if score @s Wpn.Gs.ChargeCount matches ..1 if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 3
    execute if score @s Wpn.Gs.ChargeCount matches 2.. if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 5
    execute if entity @n[tag=Temp.Victim] run tp @s @s

# 攻撃
    execute if score @s Wpn.Gs.ChargeCount matches ..1 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.Upper.1
    execute if score @s Wpn.Gs.ChargeCount matches 2 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.Upper.2
    execute if score @s Wpn.Gs.ChargeCount matches 3.. run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.GreatSword.Tec.Upper.3
    execute if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 相殺成功時
    # アーマー開始
        execute if entity @s[tag=Ply.Flag.CounterSuccess] run tag @s add Ply.Weapon.Armod.Hyper
    # 攻撃対象取得
        execute if entity @s[tag=Ply.Flag.CounterSuccess] run scoreboard players operation @s Ply.Other.AttackTargetUuid = @n[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] Entity.Uuid
    # ヒットストップ
        execute if entity @s[tag=Ply.Flag.CounterSuccess] run scoreboard players set @s Wpn.HitStopTimer 7
    # 演出
        execute if entity @s[tag=Ply.Flag.CounterSuccess] run playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
        execute if entity @s[tag=Ply.Flag.CounterSuccess] run playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
        execute if entity @s[tag=Ply.Flag.CounterSuccess] run playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.2
        execute if entity @s[tag=Ply.Flag.CounterSuccess] run playsound item.shield.block master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.2
        execute if entity @s[tag=Ply.Flag.CounterSuccess] run playsound entity.iron_golem.death master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.2
        execute if entity @s[tag=Ply.Flag.CounterSuccess] run playsound entity.iron_golem.death master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1
        execute if entity @s[tag=Ply.Flag.CounterSuccess] anchored eyes run particle firework ^ ^ ^1 0 0 0 0.4 20
        execute if entity @s[tag=Ply.Flag.CounterSuccess] anchored eyes run particle flash ^ ^ ^1 0.2 0.2 0.2 0.4 5
        execute if entity @s[tag=Ply.Flag.CounterSuccess] anchored eyes run particle crit ^ ^ ^1 0 0 0 1 50

# 終了
    tag @e[tag=Temp.Hit] remove Temp.Hit
