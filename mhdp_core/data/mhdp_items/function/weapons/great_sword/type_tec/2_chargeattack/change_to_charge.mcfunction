#> mhdp_items:weapons/great_sword/type_tec/2_chargeattack/change_to_charge
#
# 溜め斬り → 溜め
#
# @within function mhdp_items:weapons/great_sword/type_tec/2_chargeattack/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Gs.Tec.ChargeSlash
    
# 対象の処理を実行
    function mhdp_items:weapons/great_sword/type_tec/1_charge/start_with_other
