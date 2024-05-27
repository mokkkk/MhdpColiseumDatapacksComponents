#> mhdp_items:weapons/great_sword/type_tec/3_tackle/end
#
# タックル 終了処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/3_tackle/main

# タグ消去
    tag @s remove Wpn.Gs.Normal.Tackle
    tag @s remove Ply.Weapon.StaminaNotRegen

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack
