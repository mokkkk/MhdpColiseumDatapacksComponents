#> assets:object/1002.normal_block/tick/expand
#
# tick処理

# ブロック中心部に向けて少し動かす
    scoreboard players set $strength player_motion.api.launch 2500
    execute positioned ~-0.75 ~ ~-0.75 as @a[dx=1.5,dy=1.5,dz=1.5] run tp @s @s
    execute positioned ~-0.75 ~ ~-0.75 as @a[dx=1.5,dy=1.5,dz=1.5] at @s rotated ~ -90 run function player_motion:api/launch_looking
