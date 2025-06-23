#> mhdp_items:weapons/short_sword/type_tec/5_horizon_2/start
#
# 水平斬りコンボ1 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Normal.Sword.4
    tag @s remove Ply.Weapon.NoOpe

# say 武器操作：片手剣 剣コンボ4