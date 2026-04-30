#> mhdp_items:weapons/great_sword/type_tec/32_normal_attack_3/start
#
# 溜め斬り 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Tec.Attack.3
    tag @s remove Ply.Weapon.NoOpe

# say 武器操作：大剣・相殺斬り上げ