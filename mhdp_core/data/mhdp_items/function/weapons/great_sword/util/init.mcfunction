#> mhdp_items:weapons/great_sword/util/init
#
# 武器の初期化処理
#
# @within function mhdp_items:core/switch/macro/m.init

# TODO: 武器の初期化処理
    # say TODO:大剣初期化処理

# タグ付与
    tag @s add Ply.Weapon.Equip.GreatSword

# 狩技ゲージ上限決定
    scoreboard players set @s Ply.Stats.Arts.1 0
    scoreboard players set @s Ply.Stats.Arts.2 0
    execute if entity @s[tag=!Ply.Weapon.Type.Tech] run scoreboard players set @s Ply.Stats.Arts.1.Max 900
    execute if entity @s[tag=!Ply.Weapon.Type.Tech] run scoreboard players set @s Ply.Stats.Arts.2.Max 2200
    execute if entity @s[tag=Ply.Weapon.Type.Tech] run scoreboard players set @s Ply.Stats.Arts.1.Max 1200
    execute if entity @s[tag=Ply.Weapon.Type.Tech] run scoreboard players set @s Ply.Stats.Arts.2.Max 1800
    scoreboard players set @s Ply.Stats.Arts.1.Percent 0
    scoreboard players set @s Ply.Stats.Arts.2.Percent 0
