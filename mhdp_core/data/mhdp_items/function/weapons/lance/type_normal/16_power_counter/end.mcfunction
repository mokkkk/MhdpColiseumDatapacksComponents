#> mhdp_items:weapons/lance/type_tec/16_power_counter/end
#
# カウンター突き 終了処理
#
# @within function mhdp_items:weapons/lance/type_tec/16_power_counter/main

# タグ消去
    tag @s remove Wpn.Lc.Tec.PowerCounter

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/lance/util/end_attack
