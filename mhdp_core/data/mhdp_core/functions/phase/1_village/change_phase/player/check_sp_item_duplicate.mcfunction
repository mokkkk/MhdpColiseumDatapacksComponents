#> mhdp_core:phase/1_village/change_phase/player/check_sp_item_duplicate
#
# 特殊装具重複チェック
#
# @within function mhdp_core:phase/1_village/change_phase/player/check_sp_item

# チェック
    execute store result storage mhdp_core:temp Temp.ItemId int 1 run scoreboard players add #mhdp_temp_grobal MhdpCore 1
    function mhdp_core:phase/1_village/change_phase/player/macro/m.check_sp_item_duplicate with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp

# 繰り返し
    execute if score #mhdp_temp_grobal MhdpCore matches ..1012 run function mhdp_core:phase/1_village/change_phase/player/check_sp_item_duplicate
