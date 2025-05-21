#> mhdp_items:weapons/great_sword/util/drawing
#
# 武器の抜刀時処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# TODO: 武器の初期化処理
    # say TODO:大剣抜刀処理

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0
    
# ダミー用サブ武器装備
    loot replace entity @s weapon.offhand loot mhdp_items:weapons/dummy

# ステータス設定
    attribute @s attack_speed modifier add mhdp_core:weapon_attack_speed -3.0 add_value
    attribute @s movement_speed modifier add mhdp_core:weapon_movement_speed -0.00 add_value
    attribute @s attack_damage modifier remove mhdp_core:weapon_attack_damage
    attribute @s attack_damage modifier add mhdp_core:weapon_attack_damage 5.0 add_value
