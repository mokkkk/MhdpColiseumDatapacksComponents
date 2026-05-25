#> mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/end
#
# 気刃突き 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_tec/2_normal_2/main

# タグ消去
    tag @s remove Wpn.Ls.Tec.SpiritSpear
    tag @s remove Ply.Flag.Hit

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack
