#> mhdp_items:weapons/long_sword/type_normal/28_critical_juncture_counter/end
#
# 鏡花の構え・カウンター 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_normal/28_critical_juncture_counter/main

# タグ消去
    tag @s remove Wpn.Ls.Normal.CriticalCounter

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack
