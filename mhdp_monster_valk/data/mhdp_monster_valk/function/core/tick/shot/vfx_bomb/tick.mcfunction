#> mhdp_monster_valk:core/tick/shot/vfx_bomb/tick
#
# ブレスtick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タイマー増加
    scoreboard players add @s Mns.Shot.Timer 1

# 演出
    execute if score @s Mns.Shot.Timer matches ..1 run data modify entity @s text set value '{"text":"0","font":"vfx/valstrax/bomb"}'
    execute if score @s Mns.Shot.Timer matches 2 run data modify entity @s text set value '{"text":"1","font":"vfx/valstrax/bomb"}'
    execute if score @s Mns.Shot.Timer matches 3 run data modify entity @s text set value '{"text":"2","font":"vfx/valstrax/bomb"}'
    execute if score @s Mns.Shot.Timer matches 4 run data modify entity @s text set value '{"text":"3","font":"vfx/valstrax/bomb"}'
    execute if score @s Mns.Shot.Timer matches 5 run data modify entity @s text set value '{"text":"4","font":"vfx/valstrax/bomb"}'
    execute if score @s Mns.Shot.Timer matches 6 run data modify entity @s text set value '{"text":"5","font":"vfx/valstrax/bomb"}'
    execute if score @s Mns.Shot.Timer matches 7 run data modify entity @s text set value '{"text":"6","font":"vfx/valstrax/bomb"}'
    execute if score @s Mns.Shot.Timer matches 8 run data modify entity @s text set value '{"text":"7","font":"vfx/valstrax/bomb"}'
    execute if score @s Mns.Shot.Timer matches 9 run data modify entity @s text set value '{"text":"8","font":"vfx/valstrax/bomb"}'
    execute if score @s Mns.Shot.Timer matches 10.. run data modify entity @s text set value '{"text":"9","font":"vfx/valstrax/bomb"}'

# 終了
    execute if score @s Mns.Shot.Timer matches 11.. run kill @s
