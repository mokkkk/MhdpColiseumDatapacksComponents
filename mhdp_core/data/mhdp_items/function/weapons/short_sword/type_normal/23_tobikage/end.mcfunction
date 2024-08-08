#> mhdp_items:weapons/short_sword/type_normal/23_tobikage/end
#
# 飛影 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/23_tobikage/main

# タグ消去
    tag @s remove Wpn.Ss.Normal.Tobikage

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack
