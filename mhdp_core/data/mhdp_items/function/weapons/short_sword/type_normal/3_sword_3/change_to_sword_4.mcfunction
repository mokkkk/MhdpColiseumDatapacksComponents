#> mhdp_items:weapons/short_sword/type_normal/3_sword_3/change_to_sword_4
#
# 剣コンボ3 → 剣コンボ4
#
# @within function mhdp_items:weapons/short_sword/type_normal/3_sword_3/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Normal.Sword.3
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_normal/4_sword_4/start
