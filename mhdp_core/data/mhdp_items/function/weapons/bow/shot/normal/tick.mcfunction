#> mhdp_items:weapons/bow/shot/normal/tick
#
# 矢の処理
#
# @within function mhdp_items:/**

# タイマー増加
    scoreboard players add @s Mns.Shot.Timer 1
    tp @s ^ ^ ^1
    particle crit ~ ~ ~ 0 0 0 0 1

# 処理を2回実行
    # execute if entity @s[tag=!Death] at @s run function mhdp_monster_valk:core/tick/shot/shot/main
    # execute if entity @s[tag=!Death] at @s run function mhdp_monster_valk:core/tick/shot/shot/main

# 終了
    execute if entity @s[tag=!Death] if score @s Mns.Shot.Timer matches 15.. run kill @s
