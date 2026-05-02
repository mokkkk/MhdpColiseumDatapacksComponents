#> mhdp_items:weapons/lance/type_normal/20_low_spear/end
#
# 突き1 終了処理
#
# @within function mhdp_items:weapons/lance/type_normal/20_low_spear/main

# タグ消去
    tag @s remove Wpn.Lc.Normal.LowSpear

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/lance/util/end_attack
