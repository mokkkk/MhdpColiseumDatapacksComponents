#> mhdp_items:weapons/bow/type_tec/10_flying_shot/end
#
# 溜め 終了処理
#
# @within function mhdp_items:weapons/bow/type_tec/10_flying_shot/main

# タグ消去
    tag @s remove Wpn.Bw.Tec.FlyingShot
    tag @s remove Ply.Weapon.StaminaNotRegen

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/bow/util/end_attack
