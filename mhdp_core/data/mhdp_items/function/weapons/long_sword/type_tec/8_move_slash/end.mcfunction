#> mhdp_items:weapons/long_sword/type_tec/8_move_slash/end
#
# 移動斬り 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_tec/8_move_slash/main

# タグ消去
    tag @s remove Wpn.Ls.Tec.MoveSlash.Back
    tag @s remove Wpn.Ls.Tec.MoveSlash.Right
    tag @s remove Wpn.Ls.Tec.MoveSlash.Left

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack
