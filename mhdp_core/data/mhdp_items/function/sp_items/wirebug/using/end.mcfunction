#> mhdp_items:sp_items/wirebug/using/end
#
# 翔蟲の使用中処理
#
# @within function mhdp_items:sp_items/wirebug/tick

# タグ消去
    tag @s remove Itm.Sp.Wirebug.Using

# attribute消去
    attribute @s generic.gravity modifier remove mhdp_core:sp_item_gravity
