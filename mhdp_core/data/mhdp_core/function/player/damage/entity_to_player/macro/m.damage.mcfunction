#> mhdp_core:player/damage/entity_to_player/macro/m.damage
#
# ダメージ付与
#
# @within function mhdp_core:player/damage/entity_to_player/apply
# @input
#        storage mhdp_core:temp Arg.TotalDamage ダメージ量

# ダメージ
    $damage @s $(TotalDamage) minecraft:generic by @n[type=slime]
