#> mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/end
#
# 縦斬り 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/main

# タグ消去
    tag @s remove Wpn.Ls.Tec.SoaringSpirit.Jump

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack
