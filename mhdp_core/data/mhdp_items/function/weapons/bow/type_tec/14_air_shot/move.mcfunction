#> mhdp_items:weapons/bow/type_tec/14_air_shot/move
#
# チャージステップ 移動
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# 距離
    execute unless entity @s[tag=Ply.Ope.IsKeyBack] run scoreboard players set $strength player_motion.api.launch 4500

# 移動
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyLeft] rotated ~-45 ~-60 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyRight] rotated ~45 ~-60 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyLeft] rotated ~-135 ~-60 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyRight] rotated ~135 ~-60 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~ ~-60 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~180 ~-60 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~-90 ~-60 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft] rotated ~90 ~-60 run return run function player_motion:api/launch_looking
    execute rotated ~ ~-60 run function player_motion:api/launch_looking
