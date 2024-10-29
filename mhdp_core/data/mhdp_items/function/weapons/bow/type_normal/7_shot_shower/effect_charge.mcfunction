#> mhdp_items:weapons/bow/type_normal/7_shot_shower/effect_charge
#
# 竜の千々矢 メイン処理
#
# @within function mhdp_items:weapons/bow/type_normal/7_shot_shower/main

# 演出
    execute positioned ~ ~1.65 ~ run particle flash ^ ^ ^0.5 0 0 0 0 1
    execute positioned ~ ~1.65 ~ run particle crit ^ ^ ^0.5 0 0 0 1 10
    playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.1
