#> mhdp_core:player/data/remove_cache_data
#
# キャッシュしたPlayerDataを解放する
#
# @within function mhdp_core:player/**

# キャッシュデータの削除
    scoreboard players reset #mhdp_temp_loading_player_uid MhdpCore
    data remove storage mhdp_core:temp PlayerData