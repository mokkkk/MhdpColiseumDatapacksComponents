#> mhdp_items:weapons/long_sword/type_tec/2_normal_2/start_in_spirit
#
# 突き 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    execute unless score @s Wpn.Ls.SpiritLevel matches 3 run tag @s add Wpn.Ls.Tec.Normal.2.InSpirit
    execute if score @s Wpn.Ls.SpiritLevel matches 3 run tag @s add Wpn.Ls.Tec.RedNormal.1
    tag @s remove Ply.Weapon.NoOpe
