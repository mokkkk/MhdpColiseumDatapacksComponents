#> mhdp_items:weapons/lance/type_tec/6_guard/normal_guard
#
# ガード 通常ガード
#
# @within function mhdp_items:weapons/short_sword/util/guard

# ノックバックの上書き
    execute if score #mhdp_temp_knockback_strength MhdpCore matches ..1 at @s rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:false, IsAdjust:false}
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 2..3 at @s rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:10000, IsForce:false, IsAdjust:false}
    execute if score #mhdp_temp_knockback_strength MhdpCore matches 4.. at @s rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:18000, IsForce:false, IsAdjust:false}
    scoreboard players set #mhdp_temp_knockback_strength MhdpCore 0
