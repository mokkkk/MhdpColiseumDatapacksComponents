#> mhdp_items:player/weapon/stamina/penalry_end
#
# スタミナを使い切った際の処理 終了
#
# @within function mhdp_items:player/weapon/stamina/main

# タグ消去
    tag @s remove Ply.Weapon.StaminaEmpty

# 移動制限解除
    attribute @s generic.jump_strength modifier remove f-f-f-f-3
    attribute @s generic.movement_speed modifier remove f-f-f-f-4
