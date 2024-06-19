#> mhdp_items:weapons/great_sword/type_tec/5_charge_draw/change_to_chargeattack
#
# 溜め → 溜め斬り
#
# @within function mhdp_items:weapons/great_sword/type_tec/5_charge_draw/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Gs.Tec.Charge
    
# 対象の処理を実行
    function mhdp_items:weapons/great_sword/type_tec/2_chargeattack/start
