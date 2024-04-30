#> mhdp_core:player/data/check_is_get_data
#
# 現tickで既にデータ取得済みかどうか確認する
#
# @within function mhdp_core:player/**

# データ取得済みの場合、タグを付与
    execute store result score #mhdp_temp_grobal MhdpCore run data modify storage mhdp_core:temp PlayerData.Time set from storage mhdp_core:game_data Time
    execute if score #mhdp_temp_grobal MhdpCore matches ..0 run tag @s add Ply.Temp.IsGetData
    scoreboard players reset #mhdp_temp_grobal MhdpCore
