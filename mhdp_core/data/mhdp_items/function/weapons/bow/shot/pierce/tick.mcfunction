#> mhdp_items:weapons/bow/shot/pierce/tick
#
# 竜の一矢の処理
#
# @within function mhdp_items:/**

# タイマー増加
    scoreboard players add @s Mns.Shot.Timer 1

# teleport_duration設定
    execute if score @s Mns.Shot.Timer matches 1 run data modify entity @s teleport_duration set value 1

# 演出
    execute if score @s Mns.Shot.Timer matches ..5 run function mhdp_items:weapons/bow/shot/pierce/particle

# メイン処理実行
    execute at @s run function mhdp_items:weapons/bow/shot/pierce/main
    execute at @s run function mhdp_items:weapons/bow/shot/pierce/main
    scoreboard players remove @s Wpn.GeneralTimer 1

# 終了
    execute unless block ^ ^ ^ #mhdp_core:no_collision run kill @s
    execute if score @s Mns.Shot.Timer matches 40.. run kill @s
