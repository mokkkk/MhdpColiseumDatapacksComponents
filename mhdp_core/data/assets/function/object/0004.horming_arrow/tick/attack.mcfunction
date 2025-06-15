#> assets:object/0004.horming_arrow/tick/attack
#
# 矢の召喚処理
#
# @within function assets:object/0004.horming_arrow/tick/

# 攻撃主を取得
    scoreboard players operation #mhdp_temp_target_player_uid Ply.Uid = @s Ply.Uid
    execute as @a if score @s Ply.Uid = #mhdp_temp_target_player_uid Ply.Uid run tag @s add 4.TargetPlayer
    scoreboard players reset #mhdp_temp_target_player_uid

# 攻撃対象を設定
    tag @n[type=slime,tag=Mns.HitBox] add Temp.Victim

# 攻撃対象を保持
    tag @p[tag=4.TargetPlayer] add Ply.Weapon.Bow.IsHorming
    scoreboard players set @p[tag=4.TargetPlayer] Wpn.Bw.HormingTimer 200
    scoreboard players operation @p[tag=4.TargetPlayer] Wpn.Bw.HormingTarget = @n[tag=Temp.Victim] Entity.Uuid
    execute as @p[tag=4.TargetPlayer] at @s run playsound entity.player.levelup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.5

# 攻撃
    data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.1

# 攻撃実行
    execute as @a[tag=4.TargetPlayer] if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    tag @s add 4.Death
    tag @a remove 4.TargetPlayer
    scoreboard players reset #mhdp_temp_crit_min MhdpCore
    scoreboard players reset #mhdp_temp_crit_max MhdpCore
    kill @s
