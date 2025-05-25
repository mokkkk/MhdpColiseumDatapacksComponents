#> mhdp_items:items/switch/mega_potion/using
#
# 回復薬グレート使用処理
#
# @within function mhdp_items:/**

# タイマー
    scoreboard players add @s Ply.Ope.EatingTimer.Effect 1
    
# 演出
    execute if score @s Ply.Ope.EatingTimer.Effect matches 4.. positioned ~ ~1.6 ~ run particle dust{color:[0.300,1.000,0.600],scale:0.5} ^ ^ ^0.4 0.1 0.1 0.1 0 3 normal
    execute if score @s Ply.Ope.EatingTimer.Effect matches 4.. run playsound entity.generic.drink master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1

# 終了
    execute if score @s Ply.Ope.EatingTimer.Effect matches 4.. run scoreboard players set @s Ply.Ope.EatingTimer.Effect 0
