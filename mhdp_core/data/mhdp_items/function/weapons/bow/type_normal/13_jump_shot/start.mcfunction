#> mhdp_items:weapons/bow/type_normal/13_jump_shot/start
#
# 昇天煌弓・箭射 開始
#
# @within function mhdp_items:weapons/bow/type_normal/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/bow/util/before_attack

# タグ付与
    tag @s add Wpn.Bw.Normal.JumpShot
    tag @s remove Ply.Weapon.NoOpe
