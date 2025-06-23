#> mhdp_items:weapons/short_sword/util/reset
#
# 武器の初期化処理
#
# @within function mhdp_items:core/switch/macro/m.reset

# TODO: 武器のリセット処理
    # say TODO:片手剣リセット処理

# 割り込み処理
    function mhdp_items:weapons/short_sword/util/interrupt

# タグ消去
    tag @s remove Ply.Weapon.Equip.ShortSword

# 専用スコア消去
    # scoreboard players reset @s Wpn.Gs.ChargeTimer

# ステータス削除
    attribute @s attack_speed modifier remove mhdp_core:weapon_attack
    attribute @s movement_speed modifier remove mhdp_core:weapon_movement_speed
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s attack_damage modifier remove mhdp_core:weapon_attack_damage
