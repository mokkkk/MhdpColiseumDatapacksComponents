#> mhdp_items:weapons/short_sword/type_normal/10_charge/change_to_spin
#
# 溜め → 回転斬り
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Normal.Charge
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_normal/11_spin/start
