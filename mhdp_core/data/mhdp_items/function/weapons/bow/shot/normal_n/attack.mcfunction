#> mhdp_items:weapons/bow/shot/normal_n/attack
#
# 矢の処理
#
# @within function mhdp_items:/**

# 一時タグ消去
    tag @s remove Temp.This

# 攻撃主を取得
    scoreboard players operation #mhdp_temp_target_player_uid Ply.Uid = @s Ply.Uid
    execute as @a if score @s Ply.Uid = #mhdp_temp_target_player_uid Ply.Uid run tag @s add Ply.Temp.TargetSub
    scoreboard players reset #mhdp_temp_target_player_uid

# 攻撃対象を設定
    tag @n[type=slime,tag=Mns.HitBox] add Temp.Victim

# クリティカル距離設定
    scoreboard players set #mhdp_temp_crit_min MhdpCore 1
    scoreboard players set #mhdp_temp_crit_max MhdpCore 10
    execute if entity @s[tag=Wpn.Bw.Shot.Normal.Flying] run scoreboard players set #mhdp_temp_crit_max MhdpCore 30
    execute if score #mhdp_temp_crit_min MhdpCore <= @s Mns.Shot.Timer if score @s Mns.Shot.Timer <= #mhdp_temp_crit_max MhdpCore run tag @s add Temp.IsCrit

# 攻撃
    # 通常
        execute if score @s Wpn.Bw.ChargeCount matches ..0 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.1
        execute if score @s Wpn.Bw.ChargeCount matches 1 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.2
        execute if score @s Wpn.Bw.ChargeCount matches 2 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.3
        execute if score @s Wpn.Bw.ChargeCount matches 3 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.4
        execute if score @s Wpn.Bw.ChargeCount matches 4.. run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.5
    # クリティカル距離
        execute if entity @s[tag=Temp.IsCrit] as @a[tag=Ply.Temp.TargetSub] at @s run stopsound @s master entity.arrow.hit_player
        execute if entity @s[tag=Temp.IsCrit] as @a[tag=Ply.Temp.TargetSub] at @s run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches ..0 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.1.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 1 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.2.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 2 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.3.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 3 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.4.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 4.. run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.5.Crit
    execute as @a[tag=Ply.Temp.TargetSub] if entity @e[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# 終了
    scoreboard players reset #mhdp_temp_crit_min MhdpCore
    scoreboard players reset #mhdp_temp_crit_max MhdpCore
    tag @a remove Ply.Temp.TargetSub
    tag @s add Death
    kill @s
