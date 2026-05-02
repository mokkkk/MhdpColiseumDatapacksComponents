#> mhdp_items:weapons/lance/type_normal/8_guard_charge/up_charge_count
#
# 溜めカウンター メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 処理
    scoreboard players add @s Wpn.Lc.ChargeCount 1

# 演出
    particle crit ~ ~1 ~ 0 0 0 1 20
    execute if score @s Wpn.Lc.ChargeCount matches ..1 run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 0.5 1
    execute if score @s Wpn.Lc.ChargeCount matches 2 run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.Lc.ChargeCount matches 2 positioned ~ ~1.4 ~ rotated as @s positioned ^ ^ ^0.1 run particle flash{color:[1.00,1.00,1.00,1.00]} ^ ^ ^0.5 0 0 0 0 1
