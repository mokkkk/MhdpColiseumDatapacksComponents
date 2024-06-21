#> mhdp_items:weapons/great_sword/util/interrupt
#
# 武器の初期化処理
#
# @within function mhdp_items:core/switch/macro/m.interrupt

# ステータス削除
    attribute @s generic.attack_speed modifier remove mhdp_core:weapon_attack_speed
    attribute @s generic.movement_speed modifier remove mhdp_core:weapon_movement_speed
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.attack_damage modifier remove mhdp_core:weapon_attack_damage
    attribute @s generic.attack_damage modifier add mhdp_core:weapon_attack_damage 5.0 add_value
    effect clear @s slowness

# 状態タグ削除
    tag @s remove Ply.Weapon.StaminaNotRegen
    tag @s remove Ply.Weapon.Guard
    tag @s remove Ply.Weapon.Armod.Super
    tag @s remove Ply.Weapon.Armod.Hyper
    tag @s remove Ply.Flag.DrawAttack
    tag @s remove Ply.Flag.Hit

# アニメーション停止
    execute if entity @s[tag=!Ply.Weapon.Type.Tech] run function mhdp_items:weapons/great_sword/type_normal/stop_all_animation
    execute if entity @s[tag=Ply.Weapon.Type.Tech] run function mhdp_items:weapons/great_sword/type_tec/stop_all_animation
