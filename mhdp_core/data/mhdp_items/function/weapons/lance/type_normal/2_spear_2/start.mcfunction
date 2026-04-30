#> mhdp_items:weapons/lance/type_normal/2_spear_2/start
#
# 突き2 開始
#
# @within function mhdp_items:weapons/lance/type_normal/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Normal.Spear.2
    tag @s remove Ply.Weapon.NoOpe

# 突き段階設定
    scoreboard players set @s Wpn.Lc.SpearCount 1
