#> mhdp_items:core/switch/weapon_init
# 
# 分岐処理 武器の初期化処理
#
# @within function mhdp_items:/**

# 装備武器に応じてデータを設定
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:1} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "bow"
    execute if data storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data"{WeaponType:2} run data modify storage mhdp_core:temp PlayerData.WeaponTypePrefix set value "great_sword"

# 分岐処理
    data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.WeaponTypePrefix
    function mhdp_items:core/switch/macro/m.init with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
