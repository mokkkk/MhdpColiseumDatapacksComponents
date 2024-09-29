#> mhdp_items:weapons/bow/type_tec/4_charge_step/end
#
# チャージステップ 終了処理
#
# @within function mhdp_items:weapons/bow/type_tec/1_normal_1/main

# タグ消去
    tag @s remove Wpn.Bw.Tec.ChargeStep

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/bow/util/end_attack
