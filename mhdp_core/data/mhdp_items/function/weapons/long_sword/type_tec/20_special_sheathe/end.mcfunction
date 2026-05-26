#> mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/end
#
# 特殊納刀 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/main

# タグ消去
    tag @s remove Wpn.Ls.Tec.SpecialSheathe

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack

# 強制納刀
    function mhdp_items:player/weapon/sheathe/force_sheathe
