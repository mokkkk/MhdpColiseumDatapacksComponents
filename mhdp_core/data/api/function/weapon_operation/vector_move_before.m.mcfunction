#> api:weapon_operation/vector_move_before.m
#
# 武器操作時の移動用
# 実行時の向きとキー入力を元に、特定方向に移動する
# キー未入力時は移動しない
#
# @input storage api: Arg.Strength

# 空中では移動しない
    execute if entity @s[nbt={OnGround:0b}] run return 0

# 距離
    $scoreboard players set $strength player_motion.api.launch $(Strength)

# カメラ回転
    execute if entity @s[tag=Ply.Ope.IsKeyLeft] at @s run tp @s ~ ~ ~ ~5 ~
    execute if entity @s[tag=Ply.Ope.IsKeyRight] at @s run tp @s ~ ~ ~ ~5 ~

# 移動
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyLeft] rotated ~-45 -10 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyRight] rotated ~45 -10 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyLeft] rotated ~-135 -10 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyRight] rotated ~135 -10 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~ -10 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~180 -10 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~-90 -10 run return run function player_motion:api/launch_looking
    execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft] rotated ~90 -10 run return run function player_motion:api/launch_looking
