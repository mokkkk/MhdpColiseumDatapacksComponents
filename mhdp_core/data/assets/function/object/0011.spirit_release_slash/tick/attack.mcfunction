#> assets:object/0011.spirit_release_slash/tick/attack_normal
#
# 練気解放無双斬りの召喚処理
#
# @within function assets:object/0011.spirit_release_slash/tick/

# 攻撃主を取得
    scoreboard players operation #mhdp_temp_target_player_uid Ply.Uid = @s Ply.Uid
    execute as @a if score @s Ply.Uid = #mhdp_temp_target_player_uid Ply.Uid run tag @s add 11.TargetPlayer
    scoreboard players reset #mhdp_temp_target_player_uid

# 攻撃対象を取得
    scoreboard players operation #mhdp_temp_target_victim_uid Entity.Uuid = @s Ply.Other.AttackTargetUuid
    execute as @e[type=slime,tag=Mns.HitBox,distance=..50] if score @s Entity.Uuid = #mhdp_temp_target_victim_uid Entity.Uuid run tag @s add Temp.Victim
    scoreboard players reset #mhdp_temp_target_victim_uid

# 攻撃データ設定
    data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.LongSword.Tec.SpiritRelease.3

# 攻撃実行
    execute as @a[tag=11.TargetPlayer] if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    tag @a remove 11.TargetPlayer
