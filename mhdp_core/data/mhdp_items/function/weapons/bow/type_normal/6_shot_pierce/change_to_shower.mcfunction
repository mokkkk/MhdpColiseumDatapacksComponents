#> mhdp_items:weapons/bow/type_normal/6_shot_pierce/change_to_shower
#
# 竜の一矢 → 竜の千々矢
#
# @within function mhdp_items:weapons/short_sword/type_normal/1_normal_1/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/bow/util/end_attack

# タグ消去
    tag @s remove Wpn.Bw.Normal.Shot.Pierce
    
# 対象の処理を実行
    function mhdp_items:weapons/bow/type_normal/7_shot_shower/start
