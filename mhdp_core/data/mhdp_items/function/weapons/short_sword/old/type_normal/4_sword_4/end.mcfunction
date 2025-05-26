#> mhdp_items:weapons/short_sword/type_normal/4_sword_4/end
#
# 剣コンボ4 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/4_sword_4/main

# タグ消去
    tag @s remove Wpn.Ss.Normal.Sword.4

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack
