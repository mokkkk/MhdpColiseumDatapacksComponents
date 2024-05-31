#> mhdp_core:phase/1_village/change_phase/player/macro/m.check_sp_item_duplicate
#
# 特殊装具重複チェック
#
# @within function mhdp_core:phase/1_village/bell/click

# 同じ特殊装具を2つ以上持っている場合、エラー
    $execute store result score #mhdp_count MhdpCore run clear @s carrot_on_a_stick[custom_data~{IsSpItem:1b,ItemId:$(ItemId)}] 0
    execute if score #mhdp_count MhdpCore matches 2.. run tag @s add Ply.Temp.Error.DuplicateSpItems
    execute if entity @s[tag=Ply.Temp.Error.DuplicateSpItems] run data modify storage mhdp_core:temp IsError set value true
    scoreboard players reset #mhdp_count MhdpCore
