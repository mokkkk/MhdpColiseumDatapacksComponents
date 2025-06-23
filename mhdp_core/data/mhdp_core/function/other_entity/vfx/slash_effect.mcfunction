#> mhdp_core:other_entity/vfx/slash_effect
#
# 毎tick実行される処理 ダメージ表示
#
# @within function minecraft:tick

# タイマー増加
    scoreboard players add @s MhdpCore 1

# 表示変更
    execute if entity @s[tag=!Other.Text.Vfx.Strong,tag=!Other.Text.Vfx.Counter] if score @s MhdpCore matches 2 run data modify entity @s text set value {"text":"1","font":"vfx/slash"}
    execute if entity @s[tag=!Other.Text.Vfx.Strong,tag=!Other.Text.Vfx.Counter] if score @s MhdpCore matches 3 run data modify entity @s text set value {"text":"2","font":"vfx/slash"}
    execute if entity @s[tag=!Other.Text.Vfx.Strong,tag=!Other.Text.Vfx.Counter] if score @s MhdpCore matches 4 run data modify entity @s text set value {"text":"3","font":"vfx/slash"}
    execute if entity @s[tag=!Other.Text.Vfx.Strong,tag=!Other.Text.Vfx.Counter] if score @s MhdpCore matches 5 run data modify entity @s text set value {"text":"4","font":"vfx/slash"}
    execute if entity @s[tag=!Other.Text.Vfx.Strong,tag=!Other.Text.Vfx.Counter] if score @s MhdpCore matches 6 run data modify entity @s text set value {"text":"5","font":"vfx/slash"}
    execute if entity @s[tag=Other.Text.Vfx.Strong,tag=!Other.Text.Vfx.Counter] if score @s MhdpCore matches 2 run data modify entity @s text set value {"text":"1","font":"vfx/slash_strong"}
    execute if entity @s[tag=Other.Text.Vfx.Strong,tag=!Other.Text.Vfx.Counter] if score @s MhdpCore matches 3 run data modify entity @s text set value {"text":"2","font":"vfx/slash_strong"}
    execute if entity @s[tag=Other.Text.Vfx.Strong,tag=!Other.Text.Vfx.Counter] if score @s MhdpCore matches 4 run data modify entity @s text set value {"text":"3","font":"vfx/slash_strong"}
    execute if entity @s[tag=Other.Text.Vfx.Strong,tag=!Other.Text.Vfx.Counter] if score @s MhdpCore matches 5 run data modify entity @s text set value {"text":"4","font":"vfx/slash_strong"}
    execute if entity @s[tag=Other.Text.Vfx.Strong,tag=!Other.Text.Vfx.Counter] if score @s MhdpCore matches 6 run data modify entity @s text set value {"text":"5","font":"vfx/slash_strong"}
    execute if entity @s[tag=Other.Text.Vfx.Counter] if score @s MhdpCore matches 2 run data modify entity @s text set value {"text":"1","font":"vfx/slash_strong"}
    execute if entity @s[tag=Other.Text.Vfx.Counter] if score @s MhdpCore matches 3 run data modify entity @s text set value {"text":"2","font":"vfx/slash_strong"}
    execute if entity @s[tag=Other.Text.Vfx.Counter] if score @s MhdpCore matches 4 run data modify entity @s text set value {"text":"3","font":"vfx/slash_strong"}
    execute if entity @s[tag=Other.Text.Vfx.Counter] if score @s MhdpCore matches 5 run data modify entity @s text set value {"text":"4","font":"vfx/slash_strong"}
    execute if entity @s[tag=Other.Text.Vfx.Counter] if score @s MhdpCore matches 6 run data modify entity @s text set value {"text":"5","font":"vfx/slash_strong"}

# 終了
    execute if score @s MhdpCore matches 7.. run kill @s
