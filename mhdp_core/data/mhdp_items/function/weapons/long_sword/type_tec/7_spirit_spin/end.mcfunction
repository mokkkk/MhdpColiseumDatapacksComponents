#> mhdp_items:weapons/long_sword/type_tec/7_spirit_spin/end
#
# 気刃大回転斬り 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_tec/7_spirit_spin/main

# タグ消去
    tag @s remove Wpn.Ls.Tec.Spirit.Spin

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack

# 強制納刀
    # playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.7
    # function mhdp_items:player/weapon/sheathe/force_sheathe
