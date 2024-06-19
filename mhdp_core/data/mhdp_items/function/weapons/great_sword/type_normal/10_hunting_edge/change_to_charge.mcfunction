#> mhdp_items:weapons/great_sword/type_normal/10_hunting_edge/change_to_charge
#
# ハンティングエッジ → 空中溜め
#
# @within function mhdp_items:weapons/great_sword/type_normal/10_hunting_edge/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Gs.Normal.HuntingEdge
    tag @s remove Ply.Flag.Hit
    
# 対象の処理を実行
    function mhdp_items:weapons/great_sword/type_normal/11_charge_edge/start_with_other
