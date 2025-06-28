#> assets:object/0005.targetting_arrow/tick/
#
# 矢のtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# teleport_duration設定
    execute if score @s ObjectTick matches 1 run data modify entity @s teleport_duration set value 1

# ターゲット取得
    function assets:object/0005.targetting_arrow/tick/get_target
    # ターゲットに向かって移動
        execute if score @s ObjectTick matches 4..7 rotated ~ 0 positioned ^ ^ ^-1 facing entity @n[type=slime,tag=Mns.HitBox,tag=5.TargetEntity] eyes rotated ~ ~ positioned ^ ^ ^-1 facing entity @s eyes positioned as @s positioned ^ ^ ^-1 rotated as @s rotated ~ ~ positioned ^ ^ ^-1 facing entity @s eyes positioned as @s run tp @s ^ ^ ^ ~ ~
        execute if score @s ObjectTick matches 8.. facing entity @n[type=slime,tag=Mns.HitBox,tag=5.TargetEntity] eyes run tp @s ~ ~ ~ ~ ~

# メイン処理実行
    execute if entity @s[tag=!5.Death] at @s run function assets:object/0005.targetting_arrow/tick/move
    execute if entity @s[tag=!5.Death] at @s run function assets:object/0005.targetting_arrow/tick/move

# 終了
    tag @n[type=slime,tag=5.TargetEntity] remove 5.TargetEntity
    execute unless block ^ ^ ^ #mhdp_core:no_collision run kill @s
    execute if score @s ObjectTick matches 40.. run kill @s
