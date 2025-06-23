#> assets:object/0003.shower_arrow/tick/attack_normal
#
# 矢の召喚処理
#
# @within function assets:object/0003.shower_arrow/tick/

# 攻撃主を取得
    scoreboard players operation #mhdp_temp_target_player_uid Ply.Uid = @s Ply.Uid
    execute as @a if score @s Ply.Uid = #mhdp_temp_target_player_uid Ply.Uid run tag @s add 3.TargetPlayer
    scoreboard players reset #mhdp_temp_target_player_uid

# 攻撃対象を取得
    scoreboard players operation #mhdp_temp_target_victim_uid Entity.Uuid = @s Ply.Other.AttackTargetUuid
    execute as @e[type=slime,tag=Mns.HitBox,distance=..50] if score @s Entity.Uuid = #mhdp_temp_target_victim_uid Entity.Uuid run tag @s add Temp.Victim
    scoreboard players reset #mhdp_temp_target_victim_uid

# 演出
    execute at @n[tag=Temp.Victim] run particle crit ~ ~ ~ 0.5 0.5 0.5 0 3

# 攻撃
    # 通常
        data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shower
    # クリティカル距離
        execute if entity @s[tag=Temp.IsCrit] as @a[tag=3.TargetPlayer] at @s run stopsound @s master entity.arrow.hit_player
        execute if entity @s[tag=Temp.IsCrit] as @a[tag=3.TargetPlayer] at @s run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
        execute if entity @s[tag=Temp.IsCrit] run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shower.Crit

# 攻撃実行
    execute as @a[tag=3.TargetPlayer] if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    tag @a remove 3.TargetPlayer
    scoreboard players add @s MhdpCore 1
