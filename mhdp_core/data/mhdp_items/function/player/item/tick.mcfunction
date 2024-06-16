#> mhdp_items:player/item/tick
#
# playerのアイテム使用処理
#
# @within function mhdp_core:player/tick

# 使用開始
    execute if score @s Ply.Ope.EatingTimer matches 1 run function mhdp_items:player/item/start

# 使用中
    execute if score @s Ply.Ope.EatingTimer matches 1.. if items entity @s weapon.mainhand paper[custom_data~{IsMhdpItem:1b}] run function mhdp_items:player/item/using
