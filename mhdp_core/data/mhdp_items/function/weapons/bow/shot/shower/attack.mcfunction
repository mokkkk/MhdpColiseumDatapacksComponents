#> mhdp_items:weapons/bow/shot/shower/attack
#
# 矢の処理
#
# @within function mhdp_items:/**

# 攻撃主を取得
    scoreboard players operation #mhdp_temp_target_player_uid Ply.Uid = @s Ply.Uid
    execute as @a if score @s Ply.Uid = #mhdp_temp_target_player_uid Ply.Uid run tag @s add Ply.Temp.TargetSub
    scoreboard players reset #mhdp_temp_target_player_uid

# 攻撃対象を取得
    scoreboard players operation #mhdp_temp_target_victim_uid Entity.Uuid = @s Ply.Other.AttackTargetUuid
    execute as @e[type=slime,tag=Mns.HitBox] if score @s Entity.Uuid = #mhdp_temp_target_victim_uid Entity.Uuid run tag @s add Temp.Victim
    scoreboard players reset #mhdp_temp_target_victim_uid

# 演出
    execute at @n[tag=Temp.Victim] run particle crit ~ ~ ~ 0.5 0.5 0.5 0 3

# 攻撃
    # 通常
        data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.1
    # クリティカル距離
        execute if entity @s[tag=Temp.IsCrit] as @a[tag=Ply.Temp.TargetSub] at @s run stopsound @s master entity.arrow.hit_player
        execute if entity @s[tag=Temp.IsCrit] as @a[tag=Ply.Temp.TargetSub] at @s run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
        execute if entity @s[tag=Temp.IsCrit] run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.1.Crit
    execute as @a[tag=Ply.Temp.TargetSub] if entity @n[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# 終了
    tag @a remove Ply.Temp.TargetSub
    scoreboard players add @s MhdpCore 1
