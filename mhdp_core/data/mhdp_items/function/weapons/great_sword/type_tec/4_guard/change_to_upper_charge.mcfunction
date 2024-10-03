#> mhdp_items:weapons/great_sword/type_tec/4_guard/change_to_upper_charge
#
# ガード → 相殺斬り上げ・溜め
#
# @within function mhdp_items:weapons/great_sword/type_tec/2_chargeattack/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Gs.Tec.Guard
    
# 対象の処理を実行
    function mhdp_items:weapons/great_sword/type_tec/13_upper_charge/start
