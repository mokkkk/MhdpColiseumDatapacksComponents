#> assets:object/0006.jump_arrow/tick/attack_normal
#
# 矢の召喚処理
#
# @within function assets:object/0006.jump_arrow/tick/

# 攻撃
    execute unless entity @s[tag=6.IsJump] run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Jump
    execute if entity @s[tag=6.IsJump] run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Jump.Up
    execute as @a[tag=6.TargetPlayer] if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    execute unless entity @s[tag=6.IsJump] run tag @s add 6.IsHitNormal
    execute if entity @s[tag=6.IsJump] run tag @s add 6.IsHitJump
    tag @a remove 6.TargetPlayer
