#> mhdp_items:weapons/short_sword/type_normal/41_normal_attack_1/start
#
# 通常攻撃1 開始
#
# @within mhdp_items:weapons/short_sword/type_normal/main

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Normal.Attack.2
    tag @s remove Ply.Weapon.NoOpe

# say 武器操作：片手剣 通常攻撃2