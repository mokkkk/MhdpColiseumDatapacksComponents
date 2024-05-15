#> mhdp_items:player/item/start
#
# playerのアイテム使用処理
#
# @within function mhdp_core:player/tick

# メインハンドのアイテムのUseTimerを取得し、スコアとして保持
    execute if items entity @s weapon.mainhand paper[custom_data~{IsMhdpItem:1b}] store result score @s Ply.Ope.EatingTimerMax run data get entity @s SelectedItem.components."minecraft:custom_data".UseTimer

# 効果音
    playsound item.armor.equip_elytra master @s ~ ~ ~ 1 1
