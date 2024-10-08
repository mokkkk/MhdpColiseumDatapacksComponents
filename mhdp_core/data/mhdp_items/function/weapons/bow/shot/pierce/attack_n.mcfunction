#> mhdp_items:weapons/bow/shot/normal/attack
#
# 矢の処理
#
# @within function mhdp_items:/**

# 一時タグ消去
    tag @s remove Temp.This

# 一度でもヒットした場合、ホーミングしなくなる
    tag @s add Wpn.Bw.Shot.Pierce.HormingEnd

# ヒット数増加
    scoreboard players add @s MhdpCore 1
    scoreboard players add @s Wpn.GeneralTimer 1

# 攻撃主を取得
    scoreboard players operation #mhdp_temp_target_player_uid Ply.Uid = @s Ply.Uid
    execute as @a if score @s Ply.Uid = #mhdp_temp_target_player_uid Ply.Uid run tag @s add Ply.Temp.TargetSub
    scoreboard players reset #mhdp_temp_target_player_uid

# 攻撃対象を設定
    tag @n[type=slime,tag=Mns.HitBox] add Temp.Victim

# クリティカル距離設定
    scoreboard players set #mhdp_temp_crit_min MhdpCore 3
    scoreboard players set #mhdp_temp_crit_max MhdpCore 12
    execute if score #mhdp_temp_crit_min MhdpCore <= @s Mns.Shot.Timer if score @s Mns.Shot.Timer <= #mhdp_temp_crit_max MhdpCore run tag @s add Temp.IsCrit

# 攻撃
    # 通常
        execute if score @s Wpn.Bw.ChargeCount matches ..0 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Pierce.1
        execute if score @s Wpn.Bw.ChargeCount matches 1 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Pierce.2
        execute if score @s Wpn.Bw.ChargeCount matches 2 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Pierce.3
        execute if score @s Wpn.Bw.ChargeCount matches 3.. run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Pierce.4
    # クリティカル距離
        execute if entity @s[tag=Temp.IsCrit] as @a[tag=Ply.Temp.TargetSub] at @s run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches ..0 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Pierce.1.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 1 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Pierce.2.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 2 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Pierce.3.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 3.. run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Pierce.4.Crit
    # 導ノ矢補正
        execute if entity @a[tag=Ply.Temp.TargetSub,tag=Ply.Weapon.Bow.IsHorming] if score @a[tag=Ply.Temp.TargetSub,limit=1] Wpn.Bw.HormingTarget = @n[tag=Temp.Victim] Entity.Uuid run function mhdp_items:weapons/bow/shot/normal/attack_horming
    execute as @a[tag=Ply.Temp.TargetSub] if entity @e[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# ゲージ上昇
    execute as @a[tag=Ply.Temp.TargetSub] run scoreboard players add @s Wpn.Bw.Gauge 3

# 終了
    scoreboard players reset #mhdp_temp_crit_min MhdpCore
    scoreboard players reset #mhdp_temp_crit_max MhdpCore
    tag @a remove Ply.Temp.TargetSub
    execute if score @s MhdpCore matches 8.. run tag @s add Death
