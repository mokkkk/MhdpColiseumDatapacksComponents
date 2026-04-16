#> mhdp_items:weapons/lance/type_tec/9_triple_spear/start
#
# 3連突き 開始
#
# @within function mhdp_items:weapons/lance/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Tec.TripleSpear
    tag @s remove Ply.Weapon.NoOpe

# 突き段階設定
    scoreboard players set @s Wpn.Lc.SpearCount 2
