#> mhdp_items:sp_items/wirebug/util/init
#
# 特殊装具の初期化処理
# 右記functionにも、初期化処理を追加すること- mhdp_items:core/switch/item/init
#
# @within function mhdp_items:core/switch/item/init

# TODO: 特殊装具の初期化処理
    # say TODO:翔蟲初期化処理

# タグ付与
    tag @s add Itm.Sp.Wirebug

# スコア初期化
    scoreboard players set @s Itm.Wirebug.GeneralTimer 0
    scoreboard players set @s Itm.Wirebug.CoolTime 0
