#> mhdp_core:phase/1_village/change_phase/player/check_sp_item
#
# 特殊装具に関するチェック
#
# @within function mhdp_core:phase/1_village/change_phase/check_player

# 特殊装具を3つ以上持っている場合、エラー
    execute store result score #mhdp_count MhdpCore run clear @s carrot_on_a_stick[custom_data~{IsSpItem:1b}] 0
    execute if score #mhdp_count MhdpCore matches 3.. run tag @s add Ply.Temp.Error.HasManySpItems
    execute if entity @s[tag=Ply.Temp.Error.HasManySpItems] run data modify storage mhdp_core:temp IsError set value true
    scoreboard players reset #mhdp_count MhdpCore

# 重複チェック
    scoreboard players set #mhdp_temp_grobal MhdpCore 999
    function mhdp_core:phase/1_village/change_phase/player/check_sp_item_duplicate
    scoreboard players reset mhdp_temp_grobal MhdpCore
