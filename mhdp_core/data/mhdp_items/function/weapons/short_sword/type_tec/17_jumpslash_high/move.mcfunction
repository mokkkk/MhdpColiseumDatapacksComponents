#> mhdp_items:weapons/short_sword/type_tec/17_jumpslash_high/move
#
# 駆け上がり斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 移動
    tp @s @s
    scoreboard players set $strength player_motion.api.launch 5000
    scoreboard players operation #mhdo_temp_uuid MhdpCore = @s Ply.Other.AttackTargetUuid
    execute as @e[tag=Mns.HitBox,distance=..10] if score @s Entity.Uuid = #mhdo_temp_uuid MhdpCore run tag @s add Temp.Move.Target
    execute facing entity @n[tag=Temp.Move.Target] eyes rotated ~ ~-10 run function player_motion:api/launch_looking

# 終了
    tag @e[tag=Temp.Move.Target] remove Temp.Move.Target
    scoreboard players reset #mhdo_temp_uuid MhdpCore
