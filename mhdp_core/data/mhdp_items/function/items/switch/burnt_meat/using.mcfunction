#> mhdp_items:items/switch/burnt_meat/using
#
# コゲ肉使用処理
#
# @within function mhdp_items:/**

# タイマー
    scoreboard players add @s Ply.Ope.EatingTimer.Effect 1
    
# 演出
    execute if score @s Ply.Ope.EatingTimer.Effect matches 4.. positioned ~ ~1.6 ~ run particle item{item:"coal"} ^ ^ ^0.4 0.1 0.1 0.1 0.05 1 normal
    execute if score @s Ply.Ope.EatingTimer.Effect matches 4.. run playsound entity.generic.eat master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1

# 終了
    execute if score @s Ply.Ope.EatingTimer.Effect matches 4.. run scoreboard players set @s Ply.Ope.EatingTimer.Effect 0
