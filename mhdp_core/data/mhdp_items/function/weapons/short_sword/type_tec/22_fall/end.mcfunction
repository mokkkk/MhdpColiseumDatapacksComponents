#> mhdp_items:weapons/short_sword/type_tec/22_fall/end
#
# フォールバッシュ 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/22_fall/main

# タグ消去
    tag @s remove Wpn.Ss.Tec.Fall
    tag @s remove Ply.Flag.Hit

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack
