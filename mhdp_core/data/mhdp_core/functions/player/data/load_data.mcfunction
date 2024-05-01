#> mhdp_core:player/data/load_data
#
# PlayerDataを個別ストレージから読み込む
#
# @within function mhdp_core:player/**

# 既に読み込まれている場合は処理をスキップ
    execute if score @s Ply.Uid = #mhdp_temp_loading_player_uid MhdpCore run return 0 

# UID取得
    execute store result storage mhdp_core:temp UID int 1 run scoreboard players get @s Ply.Uid

# 読込処理実行
    function mhdp_core:player/data/macro/m.load_data with storage mhdp_core:temp

# 終了
    data remove storage mhdp_core:temp UID
