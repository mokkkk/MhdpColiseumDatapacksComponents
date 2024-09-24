#> mhdp_monster_valk:core/tick/shot/breath/tick
#
# ブレスtick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タイマー増加
    scoreboard players add @s Mns.Shot.Timer 1

# 処理を2回実行
    execute if entity @s[tag=!Death] at @s run function mhdp_monster_valk:core/tick/shot/shot/main
    execute if entity @s[tag=!Death] at @s run function mhdp_monster_valk:core/tick/shot/shot/main

# 終了
    execute if entity @s[tag=!Death] if score @s Mns.Shot.Timer matches 30.. positioned ~ ~1 ~ run function mhdp_monster_valk:core/tick/shot/shot/damage
