#> mhdp_items:weapons/long_sword/type_normal/3_normal_3/end
#
# 斬り上げ 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_normal/3_normal_3/main

# タグ消去
    tag @s remove Wpn.Ls.Normal.Normal.3

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack
