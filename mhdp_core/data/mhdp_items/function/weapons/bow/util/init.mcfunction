#> mhdp_items:weapons/bow/util/init
#
# 武器の初期化処理
#
# @within function mhdp_items:core/switch/macro/m.init

# TODO: 武器の初期化処理
    say TODO:弓初期化処理

# タグ付与
    tag @s add Ply.Weapon.Equip.Bow

# スコア初期化
    scoreboard players set @s Wpn.Bw.Bottle.Type 0
    scoreboard players set @s Wpn.Bw.Bottle.Count 0
