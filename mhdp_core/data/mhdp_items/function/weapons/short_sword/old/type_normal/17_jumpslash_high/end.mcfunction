#> mhdp_items:weapons/short_sword/type_normal/17_jumpslash_high/end
#
# 駆け上がり斬り 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/17_jumpslash_high/main

# タグ消去
    tag @s remove Wpn.Ss.Normal.JumpSlash.High

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack
