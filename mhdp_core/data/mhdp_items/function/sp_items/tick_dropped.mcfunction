#> mhdp_items:sp_items/tick_dropped
#
# 特殊装具のメイン処理 投げ捨て時
#
# @within function mhdp_items:sp_items/tick

# 近くにある特殊装具を消す
    execute as @e[type=minecraft:item,distance=..30] if items entity @s container.0 minecraft:carrot_on_a_stick[custom_data~{IsSpItem:1b}] run kill @s

# 分岐処理
    function mhdp_items:core/switch/item/drop
