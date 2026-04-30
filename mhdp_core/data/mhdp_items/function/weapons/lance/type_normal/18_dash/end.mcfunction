#> mhdp_items:weapons/lance/type_tec/18_dash/end
#
# 突き1 終了処理
#
# @within function mhdp_items:weapons/lance/type_tec/18_dash/main

# タグ消去
    tag @s remove Wpn.Lc.Tec.Dash
    tag @s remove Wpn.Lc.Tec.Dash.Start
    tag @s remove Wpn.Lc.Tec.Dash.Jump

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/lance/util/end_attack
