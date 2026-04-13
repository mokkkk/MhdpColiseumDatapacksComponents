#> mhdp_items:core/switch/weapon_init
# 
# 分岐処理 武器の初期化処理
#
# @within function mhdp_items:/**

# 装備武器に応じてデータを設定
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:1} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "bow"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:2} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "great_sword"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:3} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "short_sword"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:4} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "long_sword"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:5} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "hammer"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:6} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "dual_sword"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:7} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "lance"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:8} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "gun_lance"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:9} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "hunting_horn"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:10} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "slash_axe"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:11} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "charge_axe"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:12} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "insect_glaive"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:13} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "light_bowgun"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:14} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "heavy_bowgun"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:15} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "tonfa"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:16} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "accel_axe"

# 分岐処理
    data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.WeaponTypePrefix
    function mhdp_items:core/switch/macro/m.init with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp

# 反映
    function mhdp_core:player/data/save_data
