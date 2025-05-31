#> mhdp_items:weapons/short_sword/type_tec/27_charge_spear/change_to_hit
#
# 溜め斬り落とし → 溜め斬り落とし・命中
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.Normal.1
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/10_spin/start
