#> mhdp_items:weapons/great_sword/type_normal/13_charge_high/change_to_chargeattack
#
# 大溜め → 大溜め斬り
#
# @within function mhdp_items:weapons/great_sword/type_normal/13_charge_high/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Gs.Normal.CrossCharge
    
# 対象の処理を実行
    function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/start
