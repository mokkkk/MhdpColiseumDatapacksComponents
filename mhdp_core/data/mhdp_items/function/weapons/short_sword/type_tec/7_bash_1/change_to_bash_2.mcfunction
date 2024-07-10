#> mhdp_items:weapons/short_sword/type_tec/7_bash_1/change_to_bash_2
#
# 通常コンボ2 → 水平斬りコンボ1
#
# @within function mhdp_items:weapons/short_sword/type_tec/2_normal_2/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.Bash.1
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/8_bash_2/start
