#> mhdp_monsters:core/util/other/back_to_field
#
# 汎用処理 フィールドまで戻る
#
# @within function mhdp_monsters:/**

# 戻る
    summon marker ~ ~ ~ {Tags:["BackPos"]}
    execute at @s align xyz as @e[type=marker,tag=BackPos] facing entity @n[type=marker,tag=Mk.Field.Back] feet run tp @s ~ ~ ~ ~ 0
    execute as @e[type=marker,tag=BackPos] at @s run function mhdp_monsters:core/util/other/back_to_field_loop
    execute as @e[type=marker,tag=BackPos] at @s run tp @s ^ ^ ^2.5
    execute positioned as @n[type=marker,tag=BackPos] run tp @s ~ ~ ~

# 埋まってどこかに行く対策
    execute if score #mhdp_back_count MhdpCore matches 10.. at @s positioned ~ ~10 ~ run function mhdp_monsters:core/util/other/on_ground
    scoreboard players reset #mhdp_back_count MhdpCore
    kill @e[type=marker,tag=BackPos]
