#> mhdp_items:weapons/great_sword/util/interrupt
#
# 武器の初期化処理
#
# @within function mhdp_items:core/switch/macro/m.interrupt

# ステータス削除
    attribute @s generic.attack_speed modifier remove f-f-f-a-1
    attribute @s generic.movement_speed modifier remove f-f-f-a-2
    attribute @s generic.jump_strength modifier remove f-f-f-a-3
    attribute @s generic.attack_damage modifier remove f-f-f-a-4
    attribute @s generic.attack_damage modifier add f-f-f-a-4 "武器の個別攻撃力" 5.0 add_value
    effect clear @s slowness

# 状態タグ削除
    tag @s remove Ply.Weapon.StaminaNotRegen
    tag @s remove Ply.Weapon.Guard
    tag @s remove Ply.Weapon.Armod.Super
    tag @s remove Ply.Weapon.Armod.Hyper

# アニメーション停止
    execute if entity @s[tag=!Ply.Weapon.Type.Tech] run function mhdp_items:weapons/great_sword/type_normal/stop_all_animation
    execute if entity @s[tag=Ply.Weapon.Type.Tech] run function mhdp_items:weapons/great_sword/type_tec/stop_all_animation
