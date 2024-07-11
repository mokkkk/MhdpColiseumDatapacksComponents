#> mhdp_items:weapons/short_sword/type_tec/15_just_3/change_to_just_4
#
# ジャストラッシュ3 → ジャストラッシュ4
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.Just.3
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/16_just_4/start
