#> mhdp_items:items/switch/max_potion/using
#
# 秘薬使用処理
#
# @within function mhdp_items:/**

# タイマー
    scoreboard players add @s Ply.Ope.EatingTimer.Effect 1
    
# 演出
    execute if score @s Ply.Ope.EatingTimer.Effect matches 4 run particle dust{color:[100000000.000,100000000.000,1.000],scale:0.5} ^ ^1.6 ^0.4 0.1 0.1 0.1 0 3 normal
    execute if score @s Ply.Ope.EatingTimer.Effect matches 4 run playsound entity.generic.eat master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Ply.Ope.EatingTimer.Effect matches 8 run particle dust{color:[100000000.000,100000000.000,1.000],scale:0.5} ^ ^1.6 ^0.4 0.1 0.1 0.1 0 3 normal
    execute if score @s Ply.Ope.EatingTimer.Effect matches 8 run playsound entity.generic.eat master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1