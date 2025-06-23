#> api:weapon_operation/vector_move.m
#
# 実行時の向きとキー入力を元に、特定方向に移動する
#
# @input storage api: Arg.Strength

# 距離
    $scoreboard players set $strength player_motion.api.launch $(Strength)

# 引数解放
    data remove storage mhdp_core:temp Args

# 移動
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyLeft] rotated ~-45 ~ run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyRight] rotated ~45 ~ run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyLeft] rotated ~-135 ~ run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyRight] rotated ~135 ~ run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~ ~ run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~180 ~ run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~-90 ~ run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft] rotated ~90 ~ run return run function player_motion:api/launch_looking
    execute rotated ~ ~ run function player_motion:api/launch_looking


