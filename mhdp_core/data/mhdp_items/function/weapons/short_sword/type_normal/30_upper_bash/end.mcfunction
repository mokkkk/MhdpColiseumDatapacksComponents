#> mhdp_items:weapons/short_sword/type_normal/30_upper_bash/end
#
# 滅・昇竜撃 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/30_upper_bash/main

# タグ消去
    tag @s remove Wpn.Ss.Normal.UpperBash

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack
