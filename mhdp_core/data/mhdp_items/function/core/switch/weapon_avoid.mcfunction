#> mhdp_items:core/switch/weapon_avoid
# 
# 分岐処理 各武器のフレーム回避成功処理
#
# @within function mhdp_items:/**

# 念のためデータ取得
    function mhdp_core:player/data/load_data

# 分岐処理
    data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:temp PlayerData.WeaponTypePrefix
    function mhdp_items:core/switch/macro/m.avoid with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
