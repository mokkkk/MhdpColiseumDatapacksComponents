#> mhdp_items:weapons/bow/type_normal/13_jump_shot/end
#
# 昇天煌弓・箭射 終了処理
#
# @within function mhdp_items:weapons/bow/type_normal/13_jump_shot/main

# タグ消去
    tag @s remove Wpn.Bw.Tec.JumpShot

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/bow/util/end_attack
