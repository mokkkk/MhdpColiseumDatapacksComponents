#> mhdp_items:weapons/lance/type_normal/11_high_spear/end
#
# 強突き 終了処理
#
# @within function mhdp_items:weapons/lance/type_normal/11_high_spear/main

# タグ消去
    tag @s remove Wpn.Lc.Normal.HighSpear

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/lance/util/end_attack
