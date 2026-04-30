#> mhdp_items:weapons/bow/type_tec/16_shot_power_volley/end
#
# 剛射 終了処理
#
# @within function mhdp_items:weapons/bow/type_tec/16_shot_power_volley/main

# タグ消去
    tag @s remove Wpn.Bw.Tec.Shot.PowerVolley

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/bow/util/end_attack
