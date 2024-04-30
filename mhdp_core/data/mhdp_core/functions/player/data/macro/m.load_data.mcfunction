#> mhdp_core:player/data/macro/m.load_data
#
# PlayerDataを個別ストレージから読み込むマクロファンクション
#
# @within function mhdp_core:player/data/load_data

# ストレージからデータを読み込む
    $data modify storage mhdp_core:temp PlayerData set from storage mhdp_core:variable_data Player.UID$(UID).Data
