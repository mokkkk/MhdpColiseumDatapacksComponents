#> mhdp_items:weapons/great_sword/type_tec/12_chargeattack_edge/start
#
# 溜め斬り 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/11_charge_edge/change_to_chargeattack

# タグ付与
    tag @s add Wpn.Gs.Tec.ChargeSlash.Edge

# attribute設定
    attribute @s generic.jump_strength modifier remove f-f-f-a-3
    attribute @s generic.jump_strength modifier add f-f-f-a-3 "武器の個別ジャンプ力" -1 add_value

say 大剣・空中溜め斬り