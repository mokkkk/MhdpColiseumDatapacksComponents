#> mhdp_items:weapons/lance/type_normal/10_step/move
#
# ステップ 移動
#
# @within function mhdp_items:weapons/bow/type_normal/1_charge/change_to_chargeattack

# 移動: 前には移動しない
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyLeft] rotated ~-135 -15 run return run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyRight] rotated ~135 -15 run return run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~180 -15 run return run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~-90 -15 run return run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft] rotated ~90 -15 run return run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute rotated ~180 -15 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}

# # 無敵時間設定
#     scoreboard players set @s Ply.Timer.Avoid 3
