#> mhdp_core:phase/1_village/bell/schedule_remove_redstone
#
# ベルを鳴らしたレッドストーントーチを除去するスケジュール用function
#
# @within function mhdp_core:phase/1_village/bell/click

# 除去
    function mhdp_core:phase/1_village/bell/macro/m.remove_redstone with storage mhdp_core:game_data PositionList[{ID:"StartBell"}]
