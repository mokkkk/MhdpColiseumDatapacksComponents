#> mhdp_items:weapons/short_sword/type_normal/2_sword_2/end
#
# 剣コンボ2 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/2_sword_2/main

# タグ消去
    tag @s remove Wpn.Ss.Normal.Sword.2

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack
