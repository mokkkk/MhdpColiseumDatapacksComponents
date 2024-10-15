#> mhdp_items:weapons/bow/type_normal/7_shot_shower/end
#
# 剛射 終了処理
#
# @within function mhdp_items:weapons/bow/type_normal/7_shot_shower/main

# タグ消去
    tag @s remove Wpn.Bw.Normal.Shot.Shower

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/bow/util/end_attack
