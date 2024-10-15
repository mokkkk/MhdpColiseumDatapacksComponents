#> mhdp_items:weapons/great_sword/type_tec/16_cross_move/change_to_chargeattack
#
# 十字斬り開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/16_cross_move/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Gs.Tec.CrossMove
    
# 対象の処理を実行
    function mhdp_items:weapons/great_sword/type_tec/15_cross/start
