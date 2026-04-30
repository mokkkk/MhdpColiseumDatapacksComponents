#> mhdp_items:weapons/bow/type_normal/15_quick_shot/end
#
# クイックショット 終了処理
#
# @within function mhdp_items:weapons/bow/type_normal/1_normal_1/main

# タグ消去
    tag @s remove Wpn.Bw.Normal.QuickShot
    tag @s remove Ply.Weapon.StaminaNotRegen

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/bow/util/end_attack
