#> mhdp_items:weapons/short_sword/type_normal/9_bash_3/end
#
# 水平斬りコンボ3 終了処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/9_bash_3/main

# タグ消去
    tag @s remove Wpn.Ss.Normal.Bash.3

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack
