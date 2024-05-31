#> mhdp_items:sp_items/wirebug/util/reset
#
# 武器の初期化処理
#
# @within function mhdp_items:core/switch/item/init

# タグ消去
    tag @s remove Itm.Sp.Wirebug
    tag @s remove Itm.Sp.Wirebug.Using

# スコア削除
    scoreboard players reset @s Itm.Wirebug.GeneralTimer
    scoreboard players reset @s Itm.Wirebug.CoolTime

# 念のため処理用Entityを削除
    kill @e[type=marker,tag=Mk.Sp.Wirebug.Rotation]
