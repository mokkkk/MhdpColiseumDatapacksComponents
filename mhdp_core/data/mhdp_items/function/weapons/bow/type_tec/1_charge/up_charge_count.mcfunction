#> mhdp_items:weapons/bow/type_tec/1_charge/up_charge_count
#
# 溜め メイン処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# 処理
    scoreboard players add @s Wpn.Gs.ChargeCount 1

# 演出
    particle crit ~ ~1 ~ 0 0 0 1 20
    execute if score @s Wpn.Gs.ChargeCount matches ..3 run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 0.5 1
    execute if score @s Wpn.Gs.ChargeCount matches 4 run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.Gs.ChargeCount matches 4 positioned ~ ~1.4 ~ run particle flash ^ ^ ^0.1 0 0 0 0 1