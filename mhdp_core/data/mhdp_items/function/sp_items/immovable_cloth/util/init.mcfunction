#> mhdp_items:sp_items/immovable_cloth/util/init
#
# 特殊装具の初期化処理
# 右記functionにも、初期化処理を追加すること- mhdp_items:core/switch/item/init
#
# @within function mhdp_items:core/switch/item/init

# TODO: 特殊装具の初期化処理
    # say TODO:不動の装衣初期化処理

# タグ付与
    tag @s add Itm.Sp.ImmovableCloth

# スコア初期化
    scoreboard players set @s Itm.ImmovableCloth.GeneralTimer 0
    scoreboard players set @s Itm.ImmovableCloth.CoolTime 0
