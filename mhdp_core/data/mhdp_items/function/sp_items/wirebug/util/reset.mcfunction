#> mhdp_items:sp_items/wirebug/util/reset
#
# 特殊装具のリセット処理
#
# @within function mhdp_items:core/switch/item/init

# タグ消去
    tag @s remove Itm.Sp.Wirebug
    tag @s remove Itm.Sp.Wirebug.Using
    tag @s remove Itm.Sp.Wirebug.UsedSkill

# スコア削除
    scoreboard players reset @s Itm.Wirebug.GeneralTimer
    scoreboard players reset @s Itm.Wirebug.CoolTime

# attribute初期化
    attribute @s gravity modifier remove mhdp_core:sp_items_gravity

# 念のため処理用Entityを削除
    kill @e[type=marker,tag=Mk.Sp.Wirebug.Rotation]
