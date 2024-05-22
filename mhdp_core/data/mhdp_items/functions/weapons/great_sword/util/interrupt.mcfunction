#> mhdp_items:weapons/great_sword/util/interrupt
#
# 武器の初期化処理
#
# @within function mhdp_items:core/switch/macro/m.interrupt

# ステータス削除
    attribute @s generic.attack_speed modifier remove f-f-f-a-1
    attribute @s generic.movement_speed modifier remove f-f-f-a-2
    attribute @s generic.jump_strength modifier remove f-f-f-a-3
    effect clear @s slowness
    tag @s remove Ply.Weapon.StaminaNotRegen

# アニメーション停止
    execute if entity @s[tag=!Ply.Weapon.Type.Tech] run function mhdp_items:weapons/great_sword/type_normal/stop_all_animation
    execute if entity @s[tag=Ply.Weapon.Type.Tech] run function mhdp_items:weapons/great_sword/type_tec/stop_all_animation
