#> mhdp_items:weapons/long_sword/type_tec/8_move_slash/move
#
# 移動斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 移動 前には移動しない
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyLeft] rotated ~-90 ~-20 run return run function api:weapon_operation/use_player_motion.m {Strength:9000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyRight] rotated ~90 ~-20 run return run function api:weapon_operation/use_player_motion.m {Strength:9000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyLeft] rotated ~-135 ~-20 run return run function api:weapon_operation/use_player_motion.m {Strength:9000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyRight] rotated ~135 ~-20 run return run function api:weapon_operation/use_player_motion.m {Strength:9000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~180 ~-20 run return run function api:weapon_operation/use_player_motion.m {Strength:9000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~-90 ~-20 run return run function api:weapon_operation/use_player_motion.m {Strength:9000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft] rotated ~90 ~-20 run return run function api:weapon_operation/use_player_motion.m {Strength:9000, IsForce:true, IsAdjust:false}
    execute rotated ~180 ~-20 run function api:weapon_operation/use_player_motion.m {Strength:9000, IsForce:true, IsAdjust:false}

# # 無敵時間設定
#     scoreboard players set @s Ply.Timer.Avoid 3
