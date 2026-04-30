#> mhdp_items:weapons/short_sword/type_normal/10_step/end
#
# ステップ 終了処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/10_step/main

# タグ消去
    tag @s remove Wpn.Lc.Normal.Step
    tag @s remove Ply.Weapon.StaminaNotRegen

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/lance/util/end_attack
