#> assets:object/0010.helmbreaker/tick/attack_normal
#
# 兜割の召喚処理
#
# @within function assets:object/0010.helmbreaker/tick/

# 攻撃主を取得
    scoreboard players operation #mhdp_temp_target_player_uid Ply.Uid = @s Ply.Uid
    execute as @a if score @s Ply.Uid = #mhdp_temp_target_player_uid Ply.Uid run tag @s add 10.TargetPlayer
    scoreboard players reset #mhdp_temp_target_player_uid

# 攻撃対象を取得
    scoreboard players operation #mhdp_temp_target_victim_uid Entity.Uuid = @s Ply.Other.AttackTargetUuid
    execute as @e[type=slime,tag=Mns.HitBox,distance=..50] if score @s Entity.Uuid = #mhdp_temp_target_victim_uid Entity.Uuid run tag @s add Temp.Victim
    scoreboard players reset #mhdp_temp_target_victim_uid

# 攻撃データ設定
    execute if entity @s[tag=10.IsWhite] run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.LongSword.Tec.HelmBreaker.1
    execute if entity @s[tag=10.IsYellow] run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.LongSword.Tec.HelmBreaker.2
    execute if entity @s[tag=10.IsRed] run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.LongSword.Tec.HelmBreaker.3

# 攻撃実行
    execute as @a[tag=10.TargetPlayer] if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    tag @a remove 10.TargetPlayer
