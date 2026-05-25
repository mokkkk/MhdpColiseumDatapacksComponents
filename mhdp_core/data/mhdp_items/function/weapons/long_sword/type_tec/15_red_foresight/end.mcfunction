#> mhdp_items:weapons/long_sword/type_tec/15_red_foresight/end
#
# 見切り斬り 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/main

# タグ消去
    tag @s remove Wpn.Ls.Tec.RedForesight
    tag @s remove Wpn.Ls.Tec.RedForesight.Success

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack
