#> mhdp_items:weapons/lance/type_normal/7_guard_dash/start
#
# ガード 開始
#
# @within function mhdp_items:weapons/lance/type_normal/main

# スタミナが不足している場合、使用不可
    execute unless score @s Ply.Stats.Stamina matches 1.. run return 0

# 前処理
    function mhdp_items:weapons/lance/util/before_attack

# タグ付与
    tag @s add Wpn.Lc.Normal.Step
    tag @s remove Ply.Weapon.NoOpe

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 100

# 無敵時間設定
    scoreboard players set @s Ply.Timer.Avoid 3

# 飛び降り判定時間設定
    scoreboard players set @s Ply.Timer.JumpOffCheckTime 7

# キー入力方向保持
    function api:weapon_operation/save_vector_only_back
    function mhdp_core:player/data/save_data

# 移動: 前には移動しない
    tp @s @s
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyLeft] rotated ~-135 -25 run return run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=Ply.Ope.IsKeyRight] rotated ~135 -25 run return run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyBack,tag=!Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~180 -25 run return run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Ope.IsKeyRight] rotated ~-90 -25 run return run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:true, IsAdjust:false}
    execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Ope.IsKeyLeft] rotated ~90 -25 run return run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:true, IsAdjust:false}
    execute rotated ~180 -25 run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:true, IsAdjust:false}
