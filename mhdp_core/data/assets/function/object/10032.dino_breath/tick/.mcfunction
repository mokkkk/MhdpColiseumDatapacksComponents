#> assets:object/10032.dino_breath/tick/
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# 接地前：移動
    execute if entity @s[tag=!10032.OnGround,tag=!10032.IsAttacked] at @s run function assets:object/10032.dino_breath/tick/move
    execute if entity @s[tag=!10032.OnGround,tag=!10032.IsAttacked] at @s run function assets:object/10032.dino_breath/tick/move
    execute if entity @s[tag=!10032.OnGround,tag=!10032.IsAttacked] at @s run function assets:object/10032.dino_breath/tick/move

# 接地後：爆発
    execute if entity @s[tag=10032.OnGround,tag=!10032.IsAttacked] at @s run function assets:object/10032.dino_breath/tick/wait

# 終了
    execute if score @s ObjectTick matches 100.. run kill @s
