#> mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/move
#
# チャージステップ 移動
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# ステップ
    playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.3 0.1 0.3 0 8

# 無敵時間設定
    scoreboard players set @s Ply.Timer.Avoid 3

# インターバルにAnimationTimerを疑似的に使用
    scoreboard players set @s Wpn.AnimationTimer 0

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 150

# 移動
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyLeft] rotated ~-45 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:10000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyRight] rotated ~45 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:10000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyLeft] rotated ~-135 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:10000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyRight] rotated ~135 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:10000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~ ~ run return run function api:weapon_operation/use_player_motion.m {Strength:10000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~180 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:10000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~-90 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:10000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft] rotated ~90 ~ run return run function api:weapon_operation/use_player_motion.m {Strength:10000, IsForce:true, IsAdjust:false}
    execute rotated ~ ~ run function api:weapon_operation/use_player_motion.m {Strength:10000, IsForce:true, IsAdjust:false}
