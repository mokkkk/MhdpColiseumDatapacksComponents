#> mhdp_items:weapons/short_sword/type_tec/19_moveslash/change_to_horizon1
#
# 通常コンボ1 → 水平斬りコンボ1
#
# @within function mhdp_items:weapons/short_sword/type_tec/19_moveslash/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.MoveSlash
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/4_horizon_1/start
