#> mhdp_items:weapons/bow/type_tec/6_shot_pierce/start
#
# 竜の一矢 開始
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/bow/util/before_attack

# タグ付与
    tag @s add Wpn.Bw.Normal.Shot.Pierce
    tag @s remove Ply.Weapon.NoOpe

# say 武器操作：弓 竜の一矢