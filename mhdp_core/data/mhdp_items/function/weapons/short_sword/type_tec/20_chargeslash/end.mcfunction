#> mhdp_items:weapons/short_sword/type_tec/20_chargeslash/end
#
# 溜め斬り 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/20_chargeslash/main

# タグ消去
    tag @s remove Wpn.Ss.Tec.ChargeSlash

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack
