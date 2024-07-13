#> mhdp_items:weapons/short_sword/type_tec/21_jumpslash/end
#
# 駆け上がり斬り 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/main

# タグ消去
    tag @s remove Wpn.Ss.Tec.JumpSlash

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack
