#> mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/end
#
# 相殺斬り上げ 終了処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/main

# タグ消去
    tag @s remove Wpn.Gs.Tec.Attack.3

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack
