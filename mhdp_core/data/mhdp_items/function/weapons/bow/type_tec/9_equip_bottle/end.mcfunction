#> mhdp_items:weapons/bow/type_tec/9_equip_bottle/end
#
# 導ノ矢 終了処理
#
# @within function mhdp_items:weapons/bow/type_tec/9_equip_bottle/main

# タグ消去
    tag @s remove Wpn.Bw.Tec.Equip

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/bow/util/end_attack
