#> mhdp_items:weapons/short_sword/type_normal/14_just_2/start
#
# フォールバッシュ 開始
#
# @within function mhdp_items:weapons/short_sword/type_normal/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Normal.Fall.High
    tag @s remove Ply.Weapon.NoOpe

# say 武器操作：片手剣 フォールバッシュ