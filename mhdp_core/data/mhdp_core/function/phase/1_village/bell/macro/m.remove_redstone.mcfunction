#> mhdp_core:phase/1_village/bell/macro/m.remove_redstone
#
#
# クエスト出発ベルクリック時に実行
#
# @within function mhdp_core:phase/1_village/click_ui

# 除去
    $execute positioned $(X) $(Y) $(Z) run setblock ~ ~-2 ~ stone
