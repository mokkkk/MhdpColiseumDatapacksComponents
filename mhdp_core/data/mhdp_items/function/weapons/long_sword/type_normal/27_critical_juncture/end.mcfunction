#> mhdp_items:weapons/long_sword/type_normal/27_critical_juncture/end
#
# 鏡花の構え 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_normal/27_critical_juncture/main

# タグ消去
    tag @s remove Wpn.Ls.Normal.Juncture
    tag @s remove Ply.Weapon.Guard

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack
