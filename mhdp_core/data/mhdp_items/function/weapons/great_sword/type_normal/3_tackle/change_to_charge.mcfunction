#> mhdp_items:weapons/great_sword/type_normal/3_tackle/change_to_charge
#
# タックル → 溜め
#
# @within function mhdp_items:weapons/great_sword/type_normal/3_tackle/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Gs.Normal.Tackle
    tag @s remove Ply.Weapon.StaminaNotRegen

# 対象の処理を実行
    function mhdp_items:weapons/great_sword/type_normal/1_charge/start_from_tackle
