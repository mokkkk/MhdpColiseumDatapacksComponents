#> mhdp_core:phase/2_village_to_quest/change_phase/setup/player/weapon_element
#
# クエスト開始処理 プレイヤー実行 武器のセットアップ 属性値取得
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/weapon

# 初期化
    scoreboard players set @s Ply.Stats.ElementValue.Fire 0
    scoreboard players set @s Ply.Stats.ElementValue.Water 0
    scoreboard players set @s Ply.Stats.ElementValue.Thunder 0
    scoreboard players set @s Ply.Stats.ElementValue.Ice 0
    scoreboard players set @s Ply.Stats.ElementValue.Dragon 0
    scoreboard players set @s Ply.Stats.ConditionValue.Poison 0
    scoreboard players set @s Ply.Stats.ConditionValue.Paralysis 0

# 火
    execute if data storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data"{Element:1} store result score @s Ply.Stats.ElementValue.Fire run data get storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data".ElementDamage
# 水
    execute if data storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data"{Element:2} store result score @s Ply.Stats.ElementValue.Water run data get storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data".ElementDamage
# 雷
    execute if data storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data"{Element:3} store result score @s Ply.Stats.ElementValue.Thunder run data get storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data".ElementDamage
# 氷
    execute if data storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data"{Element:4} store result score @s Ply.Stats.ElementValue.Ice run data get storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data".ElementDamage
# 龍
    execute if data storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data"{Element:5} store result score @s Ply.Stats.ElementValue.Dragon run data get storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data".ElementDamage
# 毒
    execute if data storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data"{Element:6} store result score @s Ply.Stats.ConditionValue.Poison run data get storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data".ElementDamage
# 麻痺
    execute if data storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data"{Element:7} store result score @s Ply.Stats.ConditionValue.Paralysis run data get storage mhdp_core:temp PlayerData.Item.MainWeapon.components."minecraft:custom_data".ElementDamage
