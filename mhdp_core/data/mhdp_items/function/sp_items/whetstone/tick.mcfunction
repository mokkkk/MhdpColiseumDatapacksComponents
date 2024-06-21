#> mhdp_items:sp_items/whetstone/tick
#
# 翔蟲のメイン処理
#
# @within function mhdp_items:sp_items/tick

# 使用中処理
    execute if entity @s[tag=Itm.Sp.Whetstone.Using] run function mhdp_items:sp_items/whetstone/using/tick
