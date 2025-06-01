#> mhdp_items:weapons/short_sword/type_normal/17_jumpslash_high/start
#
# 駆け上がり斬り 開始
#
# @within function mhdp_items:weapons/short_sword/type_normal/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Normal.JumpSlash.High
    tag @s remove Ply.Weapon.NoOpe

# say 武器操作：片手剣 駆け上がり斬り