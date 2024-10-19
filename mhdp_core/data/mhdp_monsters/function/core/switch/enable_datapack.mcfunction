#> mhdp_monsters:core/switch/enable_datapack
# 
# 分岐処理 モンスターデータパックロード処理
#
# @within function mhdp_monsters:/**

# 分岐処理
    function mhdp_monsters:core/switch/macro/m.get_prefix with storage mhdp_core:temp Temp
    function mhdp_monsters:core/switch/macro/m.enable_datapack with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Arg

# say モンスター共通：enable_datapack