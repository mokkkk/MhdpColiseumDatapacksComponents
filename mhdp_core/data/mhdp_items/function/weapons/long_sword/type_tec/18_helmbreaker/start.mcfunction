#> mhdp_items:weapons/long_sword/type_tec/18_helmbreaker/start
#
# 気刃兜割 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ls.Tec.HelmBreaker
    tag @s add Ply.Ope.IsAir
    tag @s remove Ply.Flag.Hit
    tag @s remove Ply.Weapon.NoOpe
