#> assets:object/0012.iai_spirit_slash/tick/attack_normal
#
# オブジェクトのtick処理
#
# @within function assets:object/0012.iai_spirit_slash/tick/

# 攻撃主を取得
    scoreboard players operation #mhdp_temp_target_player_uid Ply.Uid = @s Ply.Uid
    execute as @a if score @s Ply.Uid = #mhdp_temp_target_player_uid Ply.Uid run tag @s add 12.TargetPlayer
    scoreboard players reset #mhdp_temp_target_player_uid

# 攻撃対象を取得
    scoreboard players operation #mhdp_temp_target_victim_uid Entity.Uuid = @s Ply.Other.AttackTargetUuid
    execute as @e[type=slime,tag=Mns.HitBox,distance=..50] if score @s Entity.Uuid = #mhdp_temp_target_victim_uid Entity.Uuid run tag @s add Temp.Victim
    scoreboard players reset #mhdp_temp_target_victim_uid

# 攻撃データ設定
    execute if entity @s[tag=12.IsWhite] run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.LongSword.Tec.IaiSpiritSlash.1.Success
    execute if entity @s[tag=12.IsYellow] run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.LongSword.Tec.IaiSpiritSlash.2.Success
    execute if entity @s[tag=12.IsRed] run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.LongSword.Tec.IaiSpiritSlash.3.Success

# 攻撃実行
    execute as @a[tag=12.TargetPlayer] if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 演出
    playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9

# 終了
    tag @a remove 12.TargetPlayer
