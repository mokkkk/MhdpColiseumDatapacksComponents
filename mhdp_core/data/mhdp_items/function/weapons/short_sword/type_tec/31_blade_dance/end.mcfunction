#> mhdp_items:weapons/short_sword/type_tec/31_blade_dance/end
#
# ブレイドダンス 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/main

# タグ消去
    tag @s remove Wpn.Ss.Tec.BladeDance

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack
