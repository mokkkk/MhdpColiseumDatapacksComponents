#> assets:object/10041.valk_comet/tick/
#
# VFX tick（旧 mhdp_monster_valk:core/tick/shot の frame 送り）
#
# @within function assets:core/**

# 経過
    scoreboard players add @s ObjectTick 1

# frame 送り
    execute if score @s ObjectTick matches ..1 run data modify entity @s text set value {"text":"0","font":"vfx/valstrax/flash"}
    execute if score @s ObjectTick matches 2 run data modify entity @s text set value {"text":"1","font":"vfx/valstrax/flash"}
    execute if score @s ObjectTick matches 3 run data modify entity @s text set value {"text":"2","font":"vfx/valstrax/flash"}
    execute if score @s ObjectTick matches 4 run data modify entity @s text set value {"text":"3","font":"vfx/valstrax/flash"}
    execute if score @s ObjectTick matches 5 run data modify entity @s text set value {"text":"4","font":"vfx/valstrax/flash"}
    execute if score @s ObjectTick matches 6 run data modify entity @s text set value {"text":"5","font":"vfx/valstrax/flash"}
    execute if score @s ObjectTick matches 7 run data modify entity @s text set value {"text":"6","font":"vfx/valstrax/flash"}
    execute if score @s ObjectTick matches 8 run data modify entity @s text set value {"text":"7","font":"vfx/valstrax/flash"}
    execute if score @s ObjectTick matches 9 run data modify entity @s text set value {"text":"8","font":"vfx/valstrax/flash"}

# 不透明度フェード
    execute if score @s ObjectTick matches 2 run scoreboard players set @s MhdpCore 255
    execute if score @s ObjectTick matches 6.. if score @s MhdpCore matches 1.. store result entity @s text_opacity int 1 run scoreboard players remove @s MhdpCore 20

# 終了
    execute if score @s ObjectTick matches 17.. run function assets:object/10041.valk_comet/remove/
