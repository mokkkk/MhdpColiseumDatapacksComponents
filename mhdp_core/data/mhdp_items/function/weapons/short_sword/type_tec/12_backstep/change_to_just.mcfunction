#> mhdp_items:weapons/short_sword/type_tec/12_backstep/change_to_just
#
# バックステップ → 飛び込み斬り
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_12_backstepnormal_1/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.Backstep
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/13_just_1/start
