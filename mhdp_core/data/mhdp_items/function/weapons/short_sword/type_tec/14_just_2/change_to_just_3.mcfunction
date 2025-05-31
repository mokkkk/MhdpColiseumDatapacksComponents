#> mhdp_items:weapons/short_sword/type_tec/14_just_2/change_to_just_3
#
# ジャストラッシュ2 → ジャストラッシュ3
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# ジャストラッシュ成功判定
    tag @s remove Ply.Flag.Just.Success
    execute if score @s Wpn.GeneralTimer matches 32..36 run tag @s add Ply.Flag.Just.Success

# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/15_just_3/start
