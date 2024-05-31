#> mhdp_core:phase/1_village/change_phase/player/check_cursor
#
# カーソルアイテムに関するチェック
#
# @within function mhdp_core:phase/1_village/bell/click

# カーソルにアイテムを保持している場合、エラー
    execute if items entity @s player.cursor * run tag @s add Ply.Temp.Error.HasCursorItem
    execute if entity @s[tag=Ply.Temp.Error.HasCursorItem] run data modify storage mhdp_core:temp IsError set value true
