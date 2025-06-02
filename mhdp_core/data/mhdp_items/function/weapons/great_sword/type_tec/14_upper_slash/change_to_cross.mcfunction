#> mhdp_items:weapons/great_sword/type_tec/14_upper_slash/change_to_charge
#
# 相殺斬り上げ → 十字斬り
#
# @within function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Gs.Tec.Upper
    tag @s remove Ply.Flag.CounterSuccess
    
# 対象の処理を実行
    function mhdp_items:weapons/great_sword/type_tec/16_cross_move/start
