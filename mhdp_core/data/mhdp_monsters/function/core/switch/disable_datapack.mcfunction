#> mhdp_monsters:core/switch/disable_datapack
# 
# 分岐処理 モンスターデータパック解放処理
#
# @within function mhdp_monsters:/**

# 分岐処理
    function mhdp_monsters:core/switch/macro/m.get_prefix with storage mhdp_core:temp Temp
    function mhdp_monsters:core/switch/macro/m.disable_datapack with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Arg
