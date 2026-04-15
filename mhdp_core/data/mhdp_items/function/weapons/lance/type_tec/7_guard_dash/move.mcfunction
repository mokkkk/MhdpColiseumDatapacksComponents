#> mhdp_items:weapons/lance/type_tec/7_guard_dash/move
#
# ガードダッシュ 移動
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# 移動
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyLeft] rotated ~-45 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyRight] rotated ~45 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyLeft] rotated ~-135 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyRight] rotated ~135 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~ ~ run return run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~180 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~-90 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft] rotated ~90 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:true, IsAdjust:false}
    execute rotated ~ ~ run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:true, IsAdjust:false}

# # 無敵時間設定
#     scoreboard players set @s Ply.Timer.Avoid 3
