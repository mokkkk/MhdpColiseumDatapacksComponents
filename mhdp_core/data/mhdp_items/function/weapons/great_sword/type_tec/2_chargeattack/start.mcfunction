#> mhdp_items:weapons/great_sword/type_tec/2_chargeattack/start
#
# 溜め斬り 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Gs.Tec.ChargeSlash

# attribute設定
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -1 add_value

execute if score @s Wpn.Gs.ChargeSlashCount matches 0 run say 大剣・溜め斬り
execute if score @s Wpn.Gs.ChargeSlashCount matches 1 run say 大剣・強溜め斬り
execute if score @s Wpn.Gs.ChargeSlashCount matches 2.. run say 大剣・真溜め斬り