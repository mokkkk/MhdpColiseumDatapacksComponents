#> mhdp_items:weapons/short_sword/type_normal/11_spin/end
#
# 通常コンボ2 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/2_normal_2/main

# タグ消去
    tag @s remove Wpn.Ss.Normal.Spin

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack