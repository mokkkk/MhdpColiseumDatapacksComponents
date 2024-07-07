#> mhdp_items:items/macro/m.get_use_function
#
# アイテム使用時の共通処理
#
# @within function mhdp_items:/**

# functionを取得し、実行する
    $data modify storage mhdp_core:temp Temp.Prefix set from storage mhdp_core:game_data ItemList[{Id:$(ItemName)}].Prefix
    function mhdp_items:items/macro/m.execute_use_function with storage mhdp_core:temp Temp
