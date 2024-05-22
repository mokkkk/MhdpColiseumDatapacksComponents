#> mhdp_items:weapons/great_sword/type_normal/2_chargeattack/start
#
# 溜め斬り 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/1_charge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Gs.Normal.ChargeSlash

# attribute設定
    attribute @s generic.jump_strength modifier remove f-f-f-a-3
    attribute @s generic.jump_strength modifier add f-f-f-a-3 "武器の個別ジャンプ力" -1 add_value

say 大剣・溜め斬り