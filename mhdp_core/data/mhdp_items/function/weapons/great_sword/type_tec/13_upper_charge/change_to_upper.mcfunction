#> mhdp_items:weapons/great_sword/type_tec/13_upper_charge/change_to_upper
#
# 強溜め → 溜め斬り
#
# @within function mhdp_items:weapons/great_sword/type_tec/13_upper_charge/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Gs.Tec.UpperCharge
    
# 対象の処理を実行
    function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/start
