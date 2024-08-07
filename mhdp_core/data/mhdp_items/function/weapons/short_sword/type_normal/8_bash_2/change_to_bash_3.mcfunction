#> mhdp_items:weapons/short_sword/type_normal/8_bash_2/change_to_bash_3
#
# 通常コンボ2 → 水平斬りコンボ1
#
# @within function mhdp_items:weapons/short_sword/type_normal/8_bash_2/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Normal.Bash.2
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_normal/9_bash_3/start
