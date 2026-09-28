#> mhdp_monster_valk:core/tick/shot/vfx_comet_star/tick
#
# 彗星演出tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タイマー増加
    scoreboard players add @s Mns.Shot.Timer 1

# 演出
    execute if score @s Mns.Shot.Timer matches ..1 run data modify entity @s text set value {"text":"0","font":"vfx/valstrax/star"}
    execute if score @s Mns.Shot.Timer matches 2 run data modify entity @s text set value {"text":"1","font":"vfx/valstrax/star"}
    execute if score @s Mns.Shot.Timer matches 3.. run data modify entity @s text set value {"text":"2","font":"vfx/valstrax/star"}

# 終了
    execute if score @s Mns.Shot.Timer matches 3.. run scoreboard players set @s Mns.Shot.Timer 0
