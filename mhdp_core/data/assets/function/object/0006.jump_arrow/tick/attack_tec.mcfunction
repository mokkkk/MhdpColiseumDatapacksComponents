#> assets:object/0001.normal_arrow/tick/attack_tec
#
# 矢の召喚処理
#
# @within function assets:object/0001.normal_arrow/tick/

# 攻撃
    execute unless entity @s[tag=6.IsJump] run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Jump
    execute if entity @s[tag=6.IsJump] run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Jump.Up
    execute as @a[tag=6.TargetPlayer] if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity



# ゲージ上昇
    execute as @a[tag=6.TargetPlayer] run scoreboard players add @s Wpn.Bw.Gauge 3

# 攻撃実行
    execute as @a[tag=6.TargetPlayer] if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    execute unless entity @s[tag=6.IsJump] run tag @s add 6.IsHitNormal
    execute if entity @s[tag=6.IsJump] run tag @s add 6.IsHitJump
    tag @a remove 6.TargetPlayer
