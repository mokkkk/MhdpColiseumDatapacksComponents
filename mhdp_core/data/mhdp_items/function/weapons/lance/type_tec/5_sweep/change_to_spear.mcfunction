#> mhdp_items:weapons/lance/type_tec/5_sweep/change_to_spear
#
# 薙ぎ払い 突きに遷移
#
# @within function mhdp_items:weapons/lance/type_tec/1_charge/change_to_chargeattack

# 突き段階に応じた遷移
    execute if score @s Wpn.Lc.SpearCount matches 1 run function mhdp_items:weapons/lance/type_tec/9_triple_spear/start
    execute if score @s Wpn.Lc.SpearCount matches 0 run function mhdp_items:weapons/lance/type_tec/3_spear_3/start
    execute unless score @s Wpn.Lc.SpearCount matches 0.. run function mhdp_items:weapons/lance/type_tec/2_spear_2/start
