#> mhdp_items:weapons/short_sword/type_normal/17_jumpslash_high/change_to_fall
#
# 駆け上がり斬り → フォールバッシュ
#
# @within function mhdp_items:weapons/short_sword/type_normal/17_jumpslash_high/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Normal.JumpSlash.High
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_normal/18_fall_high/start
