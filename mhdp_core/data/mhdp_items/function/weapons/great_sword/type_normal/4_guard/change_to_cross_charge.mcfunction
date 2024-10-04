#> mhdp_items:weapons/great_sword/type_normal/4_guard/change_to_cross_charge
#
# 十字斬り溜め → 十字斬り
#
# @within function mhdp_items:weapons/great_sword/type_normal/13_cross_charge/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/great_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Gs.Normal.Guard
    tag @s remove Ply.Weapon.StaminaNotRegen
    tag @s remove Ply.Weapon.Guard
    
# 対象の処理を実行
    function mhdp_items:weapons/great_sword/type_normal/13_cross_charge/start
