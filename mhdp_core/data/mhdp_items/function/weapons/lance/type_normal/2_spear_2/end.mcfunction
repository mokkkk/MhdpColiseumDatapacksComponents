#> mhdp_items:weapons/lance/type_normal/2_spear_2/end
#
# 突き2 終了処理
#
# @within function mhdp_items:weapons/lance/type_normal/2_spear_2/main

# タグ消去
    tag @s remove Wpn.Lc.Normal.Spear.2

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/lance/util/end_attack
