#> mhdp_items:weapons/short_sword/type_tec/2_normal_2/change_to_normal_2
#
# 通常コンボ1 → 通常コンボ2
#
# @within function mhdp_items:weapons/short_sword/type_tec/2_normal_2/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.Normal.2
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/3_normal_3/start
