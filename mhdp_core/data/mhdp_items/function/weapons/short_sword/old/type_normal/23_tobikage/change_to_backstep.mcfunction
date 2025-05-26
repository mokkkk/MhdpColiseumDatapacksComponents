#> mhdp_items:weapons/short_sword/type_normal/23_tobikage/change_to_backstep
#
# 飛影 → 駆け上がり斬り
#
# @within function mhdp_items:weapons/short_sword/type_normal/23_tobikage/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Normal.Tobikage
    tag @s remove Ply.Flag.Hit
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_normal/17_jumpslash_high/start
