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
    scoreboard players set @s Wpn.Bw.Gauge 0
    scoreboard players set @s Wpn.Bw.Bottle.Count 0
    # ビン種別
        scoreboard players set @s Wpn.Bw.Bottle.Type 0
        execute store result score @s Wpn.Bw.Bottle.Type run data get storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data".BowBottleType
