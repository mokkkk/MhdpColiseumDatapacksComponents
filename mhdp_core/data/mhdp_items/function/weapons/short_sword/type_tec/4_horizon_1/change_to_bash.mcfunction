#> mhdp_items:weapons/short_sword/type_tec/4_horizon_1/change_to_bash
#
# 水平斬りコンボ1 → 盾攻撃
#
# @within function mhdp_items:weapons/short_sword/type_tec/4_horizon_1/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.Horizon.1
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/7_bash_1/start
