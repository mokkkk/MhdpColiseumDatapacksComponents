#> mhdp_items:weapons/short_sword/type_normal/13_dance_rush/start
#
# 剣の舞 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Normal.DanceRush
    tag @s remove Ply.Weapon.NoOpe

# say 武器操作：片手剣 剣盾ラッシュ