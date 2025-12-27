#> api:weapon_operation/vector_move_before.m
#
# 武器操作時の移動用
# 実行時の向きとキー入力を元に、特定方向に移動する
# キー未入力時は移動しない
#
# @input storage api: Arg.Strength

# 空中では移動しない
    execute if entity @s[nbt={OnGround:0b}] run return 0
# 建築の上では移動しない
    # execute positioned ~ ~-0.5 ~ if entity @n[type=shulker,tag=Asset.Build.HitBox,dx=0.01,dy=0.01,dz=0.01] run return 0

# 距離
    # $scoreboard players set $strength player_motion.api.launch $(Strength)

# 移動
# 後ろには移動しない
    $execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyLeft] rotated ~-45 -10 run return run function api:weapon_operation/use_player_motion.m {Strength:$(Strength), IsForce:false, IsAdjust:true}
    $execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyRight] rotated ~45 -10 run return run function api:weapon_operation/use_player_motion.m {Strength:$(Strength), IsForce:false, IsAdjust:true}
    $execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~ -10 run return run function api:weapon_operation/use_player_motion.m {Strength:$(Strength), IsForce:false, IsAdjust:true}
    $execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyBack] rotated ~-90 -10 run return run function api:weapon_operation/use_player_motion.m {Strength:$(Strength), IsForce:false, IsAdjust:true}
    $execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyBack] rotated ~90 -10 run return run function api:weapon_operation/use_player_motion.m {Strength:$(Strength), IsForce:false, IsAdjust:true}

    # execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyLeft] rotated ~-45 -10 run return run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:true}
    # execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyRight] rotated ~45 -10 run return run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:true}
    # # execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyLeft] rotated ~-135 -10 run return run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:true}
    # # execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyRight] rotated ~135 -10 run return run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:true}
    # execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~ -10 run return run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:true}
    # # execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~180 -10 run return run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:true}
    # execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyBack] rotated ~-90 -10 run return run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:true}
    # execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyBack] rotated ~90 -10 run return run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:true}
