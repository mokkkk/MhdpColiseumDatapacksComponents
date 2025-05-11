#> mhdp_items:player/weapon/stamina/penalry_end
#
# スタミナを使い切った際の処理 終了
#
# @within function mhdp_items:player/weapon/stamina/main

# タグ消去
    tag @s remove Ply.Weapon.StaminaEmpty

# 移動制限解除
    attribute @s jump_strength modifier remove mhdp_core:stamina_jump_strength
    attribute @s movement_speed modifier remove mhdp_core:stamina_movement_speed
