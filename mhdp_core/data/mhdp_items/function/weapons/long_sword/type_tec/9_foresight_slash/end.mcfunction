#> mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/end
#
# 見切り斬り 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/main

# タグ消去
    tag @s remove Wpn.Ls.Tec.Foresight
    tag @s remove Wpn.Ls.Tec.Foresight.Success

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack
