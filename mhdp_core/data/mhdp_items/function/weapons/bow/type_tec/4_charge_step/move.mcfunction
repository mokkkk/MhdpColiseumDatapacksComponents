#> mhdp_items:weapons/bow/type_tec/4_charge_step/move
#
# チャージステップ 移動
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# 距離
    execute unless entity @s[tag=Ply.Ope.IsKeyBack] run scoreboard players set $strength player_motion.api.launch 8000
    # 後ろに行く場合、移動距離を短くする
    execute if entity @s[tag=Ply.Ope.IsKeyBack] run scoreboard players set $strength player_motion.api.launch 4000

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

# 無敵時間設定
    scoreboard players set @s Ply.Timer.Avoid 3
