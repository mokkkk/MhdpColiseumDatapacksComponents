#> mhdp_items:weapons/bow/type_tec/4_charge_step/change_to_charge
#
# チャージステップ → 溜め
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# タイマー初期化
# 既に引き絞った状態にするため、Timerは9に設定(10で引き絞り完了)
    scoreboard players set @s Wpn.GeneralTimer 9
    scoreboard players set @s Wpn.AnimationTimer 9

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Bw.Tec.ChargeStep
    
# 対象の処理を実行
    function mhdp_items:weapons/bow/type_tec/1_charge/start_from_shot
