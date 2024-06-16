#> mhdp_items:player/item/using
#
# playerのアイテム使用処理
#
# @within function mhdp_items:player/item/tick

# 効果音
    execute if score @s Ply.Ope.EatingTimer matches 10 run playsound entity.generic.drink master @s ~ ~ ~ 1 1
    execute if score @s Ply.Ope.EatingTimer matches 20 run playsound entity.generic.drink master @s ~ ~ ~ 1 1
    execute if score @s Ply.Ope.EatingTimer matches 30 run playsound entity.generic.drink master @s ~ ~ ~ 1 1
    execute if score @s Ply.Ope.EatingTimer matches 40 run playsound entity.generic.drink master @s ~ ~ ~ 1 1

# 使用時間 >= 指定された使用時間となったとき、効果発動
    execute if score @s Ply.Ope.EatingTimerMax <= @s Ply.Ope.EatingTimer run function mhdp_items:items/on_use
