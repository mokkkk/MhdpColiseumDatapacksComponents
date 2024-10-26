#> mhdp_core:phase/3_quest/change_phase/general/monster/main
#
# モンスターのリセット処理
#
# @within function mhdp_core:phase/3_quest/change_phase/general/main

# モンスターのremove処理
    execute as @e[type=item_display,tag=Mns.Root,tag=!Mns.Root.NotRemove] at @s run function mhdp_monsters:core/switch/remove

# データパックのdisable処理
    function mhdp_core:phase/3_quest/change_phase/general/monster/disable_datapack
