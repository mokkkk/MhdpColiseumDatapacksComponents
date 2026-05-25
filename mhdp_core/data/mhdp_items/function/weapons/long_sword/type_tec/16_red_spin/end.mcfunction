#> mhdp_items:weapons/long_sword/type_tec/16_red_spin/end
#
# 赤刃旋転斬 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_tec/16_red_spin/main

# タグ消去
    tag @s remove Wpn.Ls.Tec.RedSpin

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack
