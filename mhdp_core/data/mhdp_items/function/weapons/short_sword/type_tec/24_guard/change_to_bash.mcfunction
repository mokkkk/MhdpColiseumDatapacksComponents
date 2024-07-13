#> mhdp_items:weapons/short_sword/type_tec/24_guard/change_to_bash
#
# ガード → 盾攻撃
#
# @within function mhdp_items:weapons/short_sword/type_tec/24_guard/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.Guard
    tag @s remove Ply.Weapon.StaminaNotRegen
    tag @s remove Ply.Weapon.Guard
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/7_bash_1/start
