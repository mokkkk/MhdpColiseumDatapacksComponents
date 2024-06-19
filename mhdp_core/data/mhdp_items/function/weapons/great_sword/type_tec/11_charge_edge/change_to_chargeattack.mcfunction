#> mhdp_items:weapons/great_sword/type_tec/11_charge_edge/change_to_chargeattack
#
# 空中溜め → 空中溜め斬り
#
# @within function mhdp_items:weapons/great_sword/type_tec/11_charge_edge/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Gs.Tec.Charge.Edge
    
# 対象の処理を実行
    function mhdp_items:weapons/great_sword/type_tec/12_chargeattack_edge/start
