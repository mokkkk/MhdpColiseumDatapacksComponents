#> mhdp_items:core/switch/weapon_main
# 
# 分岐処理 武器のメイン処理
#
# @within function mhdp_items:/**

# 分岐処理
    data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.WeaponTypePrefix
    function mhdp_items:core/switch/macro/m.main with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
