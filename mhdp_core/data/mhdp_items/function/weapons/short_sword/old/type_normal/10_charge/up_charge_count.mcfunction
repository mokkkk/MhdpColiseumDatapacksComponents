#> mhdp_items:weapons/short_sword/type_normal/10_charge/up_charge_count
#
# 溜め メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 演出
    particle crit ~ ~1 ~ 0 0 0 1 20
    playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 0.5 1
    execute positioned ~ ~1.4 ~ run particle flash ^ ^ ^0.5 0 0 0 0 1
