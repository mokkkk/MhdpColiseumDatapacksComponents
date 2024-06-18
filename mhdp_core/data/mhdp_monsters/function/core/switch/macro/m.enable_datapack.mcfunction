#> mhdp_monsters:core/switch/macro/m.enable_datapack
# 
# 分岐処理 データパックロード処理 本体
#
# @within function mhdp_monsters:core/switch/enable_datapack

# 対象のモンスターのデータパックをロード
    $datapack enable "file/mhdp_monster_$(Prefix)"

say enable_datapack.macro