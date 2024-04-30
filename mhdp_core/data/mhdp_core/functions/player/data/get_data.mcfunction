#> mhdp_core:player/data/get_data
#
# playerのデータ取得処理
#
# @within function mhdp_core:player/tick

# データ読み込み
    function mhdp_core:player/data/load_data

# 確認
    function mhdp_core:player/data/check_is_get_data

# データ取得
    execute if entity @s[tag=!Ply.Temp.IsGetData] run data modify storage mhdp_core:temp TempPlayerData set from entity @s

# 武器操作用のデータ取得
    execute if entity @s[tag=Ply.State.UsingWeapon,tag=!Ply.Temp.IsGetData] run function mhdp_core:player/data/items/get_data_items

# 保存
    execute if entity @s[tag=!Ply.Temp.IsGetData] run function mhdp_core:player/data/save_data

# 終了
    data remove storage mhdp_core:temp TempPlayerData
