#> mhdp_items:weapons/short_sword/type_tec/9_bash_3/change_to_tsumuji
#
# ハードバッシュ → 旋刈り
#
# @within function mhdp_items:weapons/short_sword/type_tec/9_bash_3/main

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/short_sword/util/end_attack

# タグ消去
    tag @s remove Wpn.Ss.Tec.Bash.3
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/11_tsumuji/start
