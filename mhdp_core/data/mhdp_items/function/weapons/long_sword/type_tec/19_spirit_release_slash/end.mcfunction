#> mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/end
#
# 練気解放無双斬り 終了処理
#
# @within function mhdp_items:weapons/long_sword/type_tec/19_spirit_release_slash/main

# タグ消去
    tag @s remove Wpn.Ls.Tec.SpiritRelease

# タイマー初期化
    scoreboard players set @s Wpn.GeneralTimer 0
    scoreboard players set @s Wpn.AnimationTimer 0

# 共通処理
    function mhdp_items:weapons/long_sword/util/end_attack

# 強制納刀
    playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.7
    function mhdp_items:player/weapon/sheathe/force_sheathe
