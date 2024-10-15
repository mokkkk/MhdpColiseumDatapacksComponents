#> mhdp_items:weapons/bow/shot/horming/attack
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
    scoreboard players set #mhdp_temp_crit_min MhdpCore 3
    scoreboard players set #mhdp_temp_crit_max MhdpCore 9
    execute if score #mhdp_temp_crit_min MhdpCore <= @s Mns.Shot.Timer if score @s Mns.Shot.Timer <= #mhdp_temp_crit_max MhdpCore run tag @s add Temp.IsCrit

# 対象を取得
    tag @n[tag=Ply.Temp.TargetSub] add Ply.Weapon.Bow.IsHorming
    scoreboard players set @n[tag=Ply.Temp.TargetSub] Wpn.Bw.HormingTimer 200
    scoreboard players operation @n[tag=Ply.Temp.TargetSub] Wpn.Bw.HormingTarget = @n[tag=Temp.Victim] Entity.Uuid
    execute as @a[tag=Ply.Temp.TargetSub] at @s run playsound entity.player.levelup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.5
        
# 攻撃
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.1
    execute as @a[tag=Ply.Temp.TargetSub] if entity @e[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# 終了
    scoreboard players reset #mhdp_temp_crit_min MhdpCore
    scoreboard players reset #mhdp_temp_crit_max MhdpCore
    tag @a remove Ply.Temp.TargetSub
    tag @s add Death
    kill @s
