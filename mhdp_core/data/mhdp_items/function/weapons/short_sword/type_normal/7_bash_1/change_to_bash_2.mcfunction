#> mhdp_items:weapons/short_sword/type_normal/7_bash_1/change_to_bash_2
#
# 盾攻撃1 → 盾攻撃2
#
# @within function mhdp_items:weapons/short_sword/type_normal/7_bash_1/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Normal.Bash.1
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_normal/8_bash_2/start
