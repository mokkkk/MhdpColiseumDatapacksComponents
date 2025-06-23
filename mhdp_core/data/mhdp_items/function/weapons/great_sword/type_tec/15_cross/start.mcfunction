#> mhdp_items:weapons/great_sword/type_tec/15_cross/start
#
# 溜め斬り 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Tec.Cross
    tag @s remove Ply.Weapon.NoOpe

# say 武器操作：大剣・十字斬り