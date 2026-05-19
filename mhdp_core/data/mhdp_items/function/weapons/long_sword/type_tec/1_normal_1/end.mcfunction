#> mhdp_items:weapons/long_sword/type_tec/1_normal_1/end
#
# 縦斬り 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_normal_1/main

# タグ消去
    tag @s remove Wpn.Ls.Tec.Normal.1

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack
