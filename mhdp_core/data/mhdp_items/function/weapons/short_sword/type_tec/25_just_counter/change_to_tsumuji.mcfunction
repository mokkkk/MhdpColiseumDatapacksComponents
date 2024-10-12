#> mhdp_items:weapons/short_sword/type_tec/25_just_counter/change_to_normal_1
#
# カウンター斬り → 旋刈り
#
# @within function mhdp_items:weapons/short_sword/type_tec/25_just_counter/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.Counter
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/11_tsumuji/start
