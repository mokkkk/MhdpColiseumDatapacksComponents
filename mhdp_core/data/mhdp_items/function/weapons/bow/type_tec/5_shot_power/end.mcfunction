#> mhdp_items:weapons/bow/type_tec/5_shot_power/end
#
# 剛射 終了処理
#
# @within function mhdp_items:weapons/bow/type_tec/5_shot_power/main

# タグ消去
    tag @s remove Wpn.Bw.Tec.Shot.Power

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/bow/util/end_attack
