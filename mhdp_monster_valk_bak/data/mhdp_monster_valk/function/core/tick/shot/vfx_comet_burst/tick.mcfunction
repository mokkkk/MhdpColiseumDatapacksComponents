#> mhdp_monster_valk:core/tick/shot/vfx_comet/tick
#
# 彗星演出tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タイマー増加
    scoreboard players add @s Mns.Shot.Timer 1

# 演出
    execute if score @s Mns.Shot.Timer matches ..1 run data modify entity @s text set value {"text":"0","font":"vfx/valstrax/burst"}
    execute if score @s Mns.Shot.Timer matches 2 run data modify entity @s text set value {"text":"1","font":"vfx/valstrax/burst"}
    execute if score @s Mns.Shot.Timer matches 3 run data modify entity @s text set value {"text":"2","font":"vfx/valstrax/burst"}
    execute if score @s Mns.Shot.Timer matches 4 run data modify entity @s text set value {"text":"3","font":"vfx/valstrax/burst"}
    execute if score @s Mns.Shot.Timer matches 5 run data modify entity @s text set value {"text":"4","font":"vfx/valstrax/burst"}
    execute if score @s Mns.Shot.Timer matches 6 run data modify entity @s text set value {"text":"5","font":"vfx/valstrax/burst"}
    execute if score @s Mns.Shot.Timer matches 7 run data modify entity @s text set value {"text":"6","font":"vfx/valstrax/burst"}
    execute if score @s Mns.Shot.Timer matches 8 run data modify entity @s text set value {"text":"7","font":"vfx/valstrax/burst"}
    execute if score @s Mns.Shot.Timer matches 9 run data modify entity @s text set value {"text":"8","font":"vfx/valstrax/burst"}
    execute if score @s Mns.Shot.Timer matches 2 run scoreboard players set @s MhdpCore 255
    execute if score @s Mns.Shot.Timer matches 6.. if score @s MhdpCore matches 1.. store result entity @s text_opacity int 1 run scoreboard players remove @s MhdpCore 20

# 終了
    execute if score @s Mns.Shot.Timer matches 17.. run kill @s
