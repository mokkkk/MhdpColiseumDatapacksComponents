#> mhdp_items:weapons/short_sword/type_tec/13_just_1/change_to_just_2
#
# 飛び込み斬り → ジャストラッシュ2
#
# @within function mhdp_items:weapons/short_sword/type_tec/13_just_1/main

# ジャストラッシュ成功判定
    tag @s remove Ply.Flag.Just.Success
    execute if score @s Wpn.GeneralTimer matches 35..39 run tag @s add Ply.Flag.Just.Success

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.Just.1
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/14_just_2/start
