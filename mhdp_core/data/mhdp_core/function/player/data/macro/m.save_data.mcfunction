#> mhdp_core:player/data/macro/m.save_data
#
# PlayerDataを個別ストレージに保存するマクロファンクション
#
# @within function mhdp_core:player/data/save_data

# ストレージにデータを保存
    $data modify storage mhdp_core:variable_data Player.UID$(UID).Data set from storage mhdp_core:temp PlayerData
