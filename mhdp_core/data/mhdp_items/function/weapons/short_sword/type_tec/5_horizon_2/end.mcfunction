#> mhdp_items:weapons/short_sword/type_tec/5_horizon_2/end
#
# 水平斬りコンボ1 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/main

# タグ消去
    tag @s remove Wpn.Ss.Tec.Horizon.2

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack
