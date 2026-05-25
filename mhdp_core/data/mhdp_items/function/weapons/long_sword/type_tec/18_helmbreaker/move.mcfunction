#> mhdp_items:weapons/long_sword/type_tec/18_helmbreaker/move
#
# 気刃兜割 移動
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 移動
    tp @s @s
    scoreboard players set $strength player_motion.api.launch 5000
    scoreboard players operation #mhdo_temp_uuid MhdpCore = @s Ply.Other.AttackTargetUuid
    execute as @e[tag=Mns.HitBox,distance=..10] if score @s Entity.Uuid = #mhdo_temp_uuid MhdpCore run tag @s add Temp.Move.Target
    execute facing entity @n[tag=Temp.Move.Target] feet rotated ~ ~-10 run function api:weapon_operation/use_player_motion.m {Strength:5000, IsForce:true, IsAdjust:false}

# 終了
    tag @e[tag=Temp.Move.Target] remove Temp.Move.Target
    scoreboard players reset #mhdo_temp_uuid MhdpCore
