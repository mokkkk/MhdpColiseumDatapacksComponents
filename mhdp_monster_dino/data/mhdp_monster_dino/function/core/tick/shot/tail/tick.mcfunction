#> mhdp_monster_dino:core/tick/shot/tail/tick
#
# 尻尾tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タイマー増加
    scoreboard players add @s Mns.Shot.Timer 1

# 移動
    execute if score @s Mns.Shot.Timer matches 1 run function mhdp_monster_dino:core/tick/shot/tail/move_start
    execute if score @s Mns.Shot.Timer matches 1..18 at @s run function mhdp_monsters:core/util/other/move_to_target_move
    execute if score @s Mns.Shot.Timer matches 1..6 at @s run tp @s ~ ~1 ~ ~7 ~-5
    execute if score @s Mns.Shot.Timer matches 7..9 at @s run tp @s ~ ~0.5 ~ ~5 ~-5
    execute if score @s Mns.Shot.Timer matches 10..12 at @s run tp @s ~ ~-0.5 ~ ~3 ~-5
    execute if score @s Mns.Shot.Timer matches 13..18 at @s run tp @s ~ ~-1 ~ ~1 ~-5
    execute if score @s Mns.Shot.Timer matches 18 run function mhdp_monster_dino:core/tick/shot/tail/move_end
