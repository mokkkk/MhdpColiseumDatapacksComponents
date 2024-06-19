#> mhdp_items:items/macro/m.get_function
#
# アイテム使用時の共通処理
#
# @within function mhdp_items:/**

# functionを取得し、実行する
    $data modify storage mhdp_core:temp Temp.OnUseFunction set from storage mhdp_core:game_data ItemList[{Id:$(ItemName)}].OnUseFunction
    function mhdp_items:items/macro/m.execute_on_use with storage mhdp_core:temp Temp
