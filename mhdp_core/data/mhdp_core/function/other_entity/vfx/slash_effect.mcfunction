#> mhdp_core:other_entity/vfx/slash_effect
#
# 毎tick実行される処理 ダメージ表示
#
# @within function minecraft:tick

# タイマー増加
    scoreboard players add @s MhdpCore 1

# 表示変更
    execute if score @s MhdpCore matches 1 run data modify entity @s text set value '{"text":"1","font":"vfx/slash"}'
    execute if score @s MhdpCore matches 2 run data modify entity @s text set value '{"text":"2","font":"vfx/slash"}'
    execute if score @s MhdpCore matches 3 run data modify entity @s text set value '{"text":"3","font":"vfx/slash"}'
    execute if score @s MhdpCore matches 4 run data modify entity @s text set value '{"text":"4","font":"vfx/slash"}'
    execute if score @s MhdpCore matches 5 run data modify entity @s text set value '{"text":"5","font":"vfx/slash"}'
    execute if score @s MhdpCore matches 6 run data modify entity @s text set value '{"text":"6","font":"vfx/slash"}'
    execute if score @s MhdpCore matches 7 run data modify entity @s text set value '{"text":"7","font":"vfx/slash"}'
    execute if score @s MhdpCore matches 8 run data modify entity @s text set value '{"text":"8","font":"vfx/slash"}'
    execute if score @s MhdpCore matches 9 run data modify entity @s text set value '{"text":"9","font":"vfx/slash"}'
    execute if score @s MhdpCore matches 10 run data modify entity @s text set value '{"text":"a","font":"vfx/slash"}'
    execute if score @s MhdpCore matches 11 run data modify entity @s text set value '{"text":"b","font":"vfx/slash"}'

# 終了
    execute if score @s MhdpCore matches 11.. run kill @s
