#> mhdp_items:weapons/lance/type_tec/10_step/start_noope
#
# ガード 開始
#
# @within function mhdp_items:weapons/lance/type_tec/main

# スタミナが不足している場合、使用不可
    execute unless score @s Ply.Stats.Stamina matches 1.. run return 0

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Tec.Step
    tag @s remove Ply.Weapon.NoOpe

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 100

# 移動
    tp @s @s
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyLeft] rotated ~-45 -15 run return run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=Ply.Ope.IsKeyRight] rotated ~45 -15 run return run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyLeft] rotated ~-135 -15 run return run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyRight] rotated ~135 -15 run return run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~ -15 run return run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~180 -15 run return run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~-90 -15 run return run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft] rotated ~90 -15 run return run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
    execute rotated ~ -15 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:true, IsAdjust:false}
