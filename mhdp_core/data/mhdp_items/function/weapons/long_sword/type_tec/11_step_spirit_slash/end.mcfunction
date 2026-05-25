#> mhdp_items:weapons/long_sword/type_tec/11_step_spirit_slash/end
#
# 踏み込み気刃斬り 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_tec/11_step_spirit_slash/main

# タグ消去
    tag @s remove Wpn.Ls.Tec.Spirit.Step

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack
