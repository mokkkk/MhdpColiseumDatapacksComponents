#> mhdp_items:player/item/using
#
# playerのアイテム使用処理
#
# @within function mhdp_items:player/item/tick

# アイテムごとの使用中演出
    function mhdp_items:items/using

# 使用時間 >= 指定された使用時間となったとき、効果発動
    execute if score @s Ply.Ope.EatingTimerMax <= @s Ply.Ope.EatingTimer run function mhdp_items:items/on_use
