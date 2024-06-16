#> mhdp_core:debug/get_player_data
#
# デバッグ用処理 プレイヤー個別ストレージの取得

# 取得
    function mhdp_core:player/data/load_data
    data modify storage mhdp_core:temp Debug set from storage mhdp_core:temp PlayerData
