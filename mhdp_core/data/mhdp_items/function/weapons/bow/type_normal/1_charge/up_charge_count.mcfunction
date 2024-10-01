#> mhdp_items:weapons/bow/type_normal/1_charge/up_charge_count
#
# 溜め メイン処理
#
# @within function mhdp_items:weapons/bow/type_normal/main

# 処理
    scoreboard players set @s Wpn.Bw.ChargeCount 3

# 演出
    execute positioned ~ ~1.65 ~ run particle crit ^ ^ ^0.1 0 0 0 1 10
    playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.1
