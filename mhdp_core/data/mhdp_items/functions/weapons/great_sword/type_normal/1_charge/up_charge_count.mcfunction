#> mhdp_items:weapons/great_sword/type_normal/1_charge/up_charge_count
#
# 溜め メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 処理
    scoreboard players add @s Wpn.Gs.ChargeCount 1

# 演出
    playsound entity.arrow.hit_player master @s ~ ~ ~ 1 1
    particle crit ~ ~1 ~ 0 0 0 1 30
    execute if score @s Wpn.Gs.ChargeCount matches 3 run playsound entity.arrow.hit_player master @s ~ ~ ~ 1 1.02
    execute if score @s Wpn.Gs.ChargeCount matches 3 positioned ~ ~1.4 ~ run particle flash ^ ^ ^0.1 0 0 0 0 1
