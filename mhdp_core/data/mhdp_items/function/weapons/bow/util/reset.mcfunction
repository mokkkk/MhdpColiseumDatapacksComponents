#> mhdp_items:weapons/bow/util/reset
#
# 武器の初期化処理
#
# @within function mhdp_items:core/switch/macro/m.reset

# TODO: 武器のリセット処理
    say TODO:弓リセット処理

# 割り込み処理
    function mhdp_items:weapons/bow/util/interrupt

# タグ消去
    tag @s remove Ply.Weapon.Equip.Bow

# 専用スコア消去
    # scoreboard players reset @s Wpn.Gs.ChargeTimer

# ステータス削除
    attribute @s generic.attack_speed modifier remove mhdp_core:weapon_attack
    attribute @s generic.movement_speed modifier remove mhdp_core:weapon_movement_speed
    attribute @s generic.movement_speed modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.attack_damage modifier remove mhdp_core:weapon_attack_damage