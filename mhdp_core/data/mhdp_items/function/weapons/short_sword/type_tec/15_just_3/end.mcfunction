#> mhdp_items:weapons/short_sword/type_tec/15_just_3/end
#
# ジャストラッシュ2 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/15_just_3/main

# タグ消去
    tag @s remove Wpn.Ss.Tec.Just.3
    tag @s remove Ply.Flag.Just.Success

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack