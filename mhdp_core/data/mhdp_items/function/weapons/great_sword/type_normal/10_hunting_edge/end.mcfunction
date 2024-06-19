#> mhdp_items:weapons/great_sword/type_normal/10_hunting_edge/end
#
# ハンティングエッジ 終了処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/10_hunting_edge/main

# タグ消去
    tag @s remove Wpn.Gs.Normal.HuntingEdge

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack
