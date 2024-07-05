#> mhdp_monsters:core/util/tick/start_blink
# 
# 汎用処理 まばたき開始
#
# @within function mhdp_monsters:core/util/tick/tick

# まばたきのタイマーを設定
    execute unless score @s Mns.General.BlinkTimer matches 6.. run scoreboard players set @s Mns.General.BlinkTimer 5
    scoreboard players set @s Mns.General.BlinkTimer.Check 0
