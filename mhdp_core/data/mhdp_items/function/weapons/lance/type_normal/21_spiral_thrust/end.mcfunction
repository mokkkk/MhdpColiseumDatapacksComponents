#> mhdp_items:weapons/lance/type_tec/21_spiral_thrust/end
#
# 流転突き 終了処理
#
# @within function mhdp_items:weapons/lance/type_tec/21_spiral_thrust/main

# タグ消去
    tag @s remove Wpn.Lc.Tec.Spiral
    tag @s remove Ply.Flag.Hit

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/lance/util/end_attack
