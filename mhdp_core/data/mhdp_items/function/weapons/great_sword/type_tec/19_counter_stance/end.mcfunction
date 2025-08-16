#> mhdp_items:weapons/great_sword/type_normal/19_counter_stance/end
#
# 威姿呵成の構え 終了処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/1_charge/main

# タグ消去
    tag @s remove Wpn.Gs.Tec.CounterStance

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack
