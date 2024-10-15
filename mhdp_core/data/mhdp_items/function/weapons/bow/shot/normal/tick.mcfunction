#> mhdp_items:weapons/bow/shot/normal/tick
#
# 矢の処理
#
# @within function mhdp_items:/**

# タイマー増加
    scoreboard players add @s Mns.Shot.Timer 1

# teleport_duration設定
    execute if score @s Mns.Shot.Timer matches 1 run data modify entity @s teleport_duration set value 1

# メイン処理実行
    execute if entity @s[tag=!Death] at @s run function mhdp_items:weapons/bow/shot/normal/main
    execute if entity @s[tag=!Death] at @s run function mhdp_items:weapons/bow/shot/normal/main

# 終了
    execute unless block ^ ^ ^ #mhdp_core:no_collision run kill @s
    execute if score @s Mns.Shot.Timer matches 40.. run kill @s
