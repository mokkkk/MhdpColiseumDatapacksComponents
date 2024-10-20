#> mhdp_items:sp_items/immovable_cloth/using/tick
#
# 不動の装衣の使用中処理
#
# @within function mhdp_items:sp_items/immovable_cloth/tick

# タイマー増加
    scoreboard players add @s Itm.ImmovableCloth.GeneralTimer 1

# 演出
    execute if score @s Itm.ImmovableCloth.GeneralTimer matches 1 run function mhdp_items:sp_items/immovable_cloth/using/start

# 終了
    execute if score @s Itm.ImmovableCloth.GeneralTimer matches 1800.. run function mhdp_items:sp_items/immovable_cloth/using/end
