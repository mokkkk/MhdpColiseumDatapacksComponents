#> mhdp_items:weapons/long_sword/type_tec/15_red_foresight/success
#
# 見切り斬り・旋 成功判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 演出
    particle end_rod ~ ~1.65 ~ 0 0 0 0.1 5
    playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 2

# タグ更新
    tag @s remove Wpn.Ls.Tec.RedForesight
    tag @s add Wpn.Ls.Tec.RedForesight.Success
    scoreboard players add @s Wpn.Ls.SpiritLevelGauge 120
