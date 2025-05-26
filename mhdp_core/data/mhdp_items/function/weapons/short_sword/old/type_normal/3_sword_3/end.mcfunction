#> mhdp_items:weapons/short_sword/type_normal/3_sword_3/end
#
# 剣コンボ3 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/3_sword_3/main

# タグ消去
    tag @s remove Wpn.Ss.Normal.Sword.3

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack
