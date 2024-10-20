#> mhdp_items:weapons/short_sword/type_normal/24_guard/change_to_charge
#
# ガード → 盾攻撃
#
# @within function mhdp_items:weapons/short_sword/type_normal/24_guard/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Normal.Guard
    tag @s remove Ply.Weapon.StaminaNotRegen
    tag @s remove Ply.Weapon.Guard
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_normal/10_charge/start
