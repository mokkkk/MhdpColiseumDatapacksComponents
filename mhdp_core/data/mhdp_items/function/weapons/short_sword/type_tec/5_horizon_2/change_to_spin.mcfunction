#> mhdp_items:weapons/short_sword/type_tec/5_horizon_2/change_to_spin
#
# 水平斬りコンボ2 → 回転斬り
#
# @within function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.Horizon.2
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/10_spin/start
