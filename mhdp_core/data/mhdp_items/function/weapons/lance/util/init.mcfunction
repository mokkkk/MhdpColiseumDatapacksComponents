#> mhdp_items:weapons/lance/util/init
#
# 武器の初期化処理
#
# @within function mhdp_items:core/switch/macro/m.init

# TODO: 武器の初期化処理
    # say TODO:ランス初期化処理

# タグ付与
    tag @s add Ply.Weapon.Equip.Lance

# 狩技ゲージ上限決定
    scoreboard players set @s Ply.Stats.Arts.1 0
    scoreboard players set @s Ply.Stats.Arts.2 0
    scoreboard players set @s Ply.Stats.Arts.1.Max 1
    scoreboard players set @s Ply.Stats.Arts.2.Max 1
    scoreboard players set @s Ply.Stats.Arts.1.Max 100
    scoreboard players set @s Ply.Stats.Arts.2.Max 100
    scoreboard players set @s Ply.Stats.Arts.1.Percent 0
    scoreboard players set @s Ply.Stats.Arts.2.Percent 0
