#> mhdp_items:weapons/bow/type_tec/3_shot_max/change_to_shot_pierce
#
# 射撃 → 竜の一矢
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Bw.Tec.Shot.Max
    
# 対象の処理を実行
    function mhdp_items:weapons/bow/type_tec/6_shot_pierce/start
