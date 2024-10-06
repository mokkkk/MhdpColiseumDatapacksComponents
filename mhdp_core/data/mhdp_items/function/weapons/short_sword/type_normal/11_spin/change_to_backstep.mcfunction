#> mhdp_items:weapons/short_sword/type_tec/10_spin/change_to_backstep
#
# 回転斬り → バックステップ
#
# @within function mhdp_items:weapons/short_sword/type_tec/10_spin/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.Spin
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/12_backstep/start
