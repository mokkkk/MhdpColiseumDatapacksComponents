#> mhdp_monsters:core/switch/macro/m.disable_datapack
# 
# 分岐処理 データパック解放処理
#
# @within function mhdp_monsters:core/switch/remove

# 対象のモンスターのデータパックを解放
    $datapack disable "file/mhdp_monster_$(Prefix)"
