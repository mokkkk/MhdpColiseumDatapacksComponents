#> mhdp_items:weapons/lance/util/reset
#
# 武器の初期化処理
#
# @within function mhdp_items:core/switch/macro/m.reset

# TODO: 武器のリセット処理
    # say TODO:ランスリセット処理

# 割り込み処理
    function mhdp_items:weapons/lance/util/interrupt

# タグ消去
    function api:weapon_operation/reset_state_tags
    tag @s remove Ply.Weapon.Equip.Lance

# 専用スコア消去
    scoreboard players reset @s Wpn.Lc.SpearCount
    scoreboard players reset @s Wpn.Lc.RageLevel
    scoreboard players reset @s Wpn.Lc.RageTimer

# ステータス削除
    attribute @s attack_speed modifier remove mhdp_core:weapon_attack
    attribute @s movement_speed modifier remove mhdp_core:weapon_movement_speed
    attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s attack_damage modifier remove mhdp_core:weapon_attack_damage
    attribute @s gravity modifier remove mhdp_core:weapon_gravity
