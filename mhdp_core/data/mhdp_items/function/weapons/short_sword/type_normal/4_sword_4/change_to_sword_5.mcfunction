#> mhdp_items:weapons/short_sword/type_normal/4_sword_4/change_to_sword_5
#
# 剣コンボ4 → 剣コンボ5
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Normal.Sword.4
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_normal/5_sword_5/start
