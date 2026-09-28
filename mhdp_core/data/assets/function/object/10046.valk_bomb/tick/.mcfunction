#> assets:object/10046.valk_bomb/tick/
#
# VFX tick（旧 mhdp_monster_valk:core/tick/shot の frame 送り）
#
# @within function assets:core/**

# 経過
    scoreboard players add @s ObjectTick 1

# frame 送り
    execute if score @s ObjectTick matches ..1 run data modify entity @s text set value {"text":"0","font":"vfx/valstrax/bomb"}
    execute if score @s ObjectTick matches 2 run data modify entity @s text set value {"text":"1","font":"vfx/valstrax/bomb"}
    execute if score @s ObjectTick matches 3 run data modify entity @s text set value {"text":"2","font":"vfx/valstrax/bomb"}
    execute if score @s ObjectTick matches 4 run data modify entity @s text set value {"text":"3","font":"vfx/valstrax/bomb"}
    execute if score @s ObjectTick matches 5 run data modify entity @s text set value {"text":"4","font":"vfx/valstrax/bomb"}
    execute if score @s ObjectTick matches 6 run data modify entity @s text set value {"text":"5","font":"vfx/valstrax/bomb"}
    execute if score @s ObjectTick matches 7 run data modify entity @s text set value {"text":"6","font":"vfx/valstrax/bomb"}
    execute if score @s ObjectTick matches 8 run data modify entity @s text set value {"text":"7","font":"vfx/valstrax/bomb"}
    execute if score @s ObjectTick matches 9 run data modify entity @s text set value {"text":"8","font":"vfx/valstrax/bomb"}
    execute if score @s ObjectTick matches 10 run data modify entity @s text set value {"text":"9","font":"vfx/valstrax/bomb"}

# 終了
    execute if score @s ObjectTick matches 11.. run function assets:object/10046.valk_bomb/remove/
