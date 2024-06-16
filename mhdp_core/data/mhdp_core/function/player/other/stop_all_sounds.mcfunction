#> mhdp_core:player/other/stop_all_sounds
#
# playerの無音処理
#
# @within function mhdp_core:player/tick

# master以外の音を止める
    stopsound @s player
    stopsound @s ambient
    stopsound @s block
    stopsound @s hostile
    stopsound @s music
    stopsound @s neutral
    stopsound @s record
    stopsound @s voice
    stopsound @s weather
