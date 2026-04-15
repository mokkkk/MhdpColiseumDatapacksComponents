#> mhdp_items:weapons/lance/type_tec/8_dash_spear/start
#
# 飛び込み突き 開始
#
# @within function mhdp_items:weapons/lance/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Tec.DashSpear
    tag @s remove Ply.Weapon.NoOpe

# 突き段階設定
    scoreboard players set @s Wpn.Lc.SpearCount 0
