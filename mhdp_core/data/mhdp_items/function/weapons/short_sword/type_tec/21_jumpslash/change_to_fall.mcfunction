#> mhdp_items:weapons/short_sword/type_tec/21_jumpslash/change_to_fall
#
# 通常コンボ1 → 盾攻撃
#
# @within function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.JumpSlash
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/22_fall/start
