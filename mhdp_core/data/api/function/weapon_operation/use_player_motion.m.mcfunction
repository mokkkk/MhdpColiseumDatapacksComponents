#> api:weapon_operation/use_player_motion.m
#
# PlayerMotion用のラッパーAPI
#
# @input storage api: Arg.Strength 飛距離
# @input storage api: Arg.IsForce falseの場合、建築上では移動しなくなる
# @input storage api: Arg.IsAdjust trueの場合、建築上では移動角度が制限される

# データ設定
    $data modify storage mhdp_core:temp Temp.Pm set value {Strength:$(Strength),IsForce:$(IsForce),IsAdjust:$(IsAdjust)}

# IsForce:falseの場合、建築上では移動しない
    execute if data storage mhdp_core:temp Temp.Pm{IsForce:0} positioned ~ ~-0.5 ~ if entity @n[type=shulker,tag=Asset.Build.HitBox,dx=0.01,dy=0.01,dz=0.01] run return run data remove storage mhdp_core:temp Temp.Pm

# 値設定
    $scoreboard players set $strength player_motion.api.launch $(Strength)

# IsAdjust:trueの場合、飛距離を下げる
    execute if data storage mhdp_core:temp Temp.Pm{IsAdjust:1} positioned ~ ~-0.5 ~ if entity @n[type=shulker,tag=Asset.Build.HitBox,dx=0.01,dy=0.01,dz=0.01] store result score $strength player_motion.api.launch run data get storage mhdp_core:temp Temp.Pm.Strength 0.5

# 移動
    function player_motion:api/launch_looking

# 終了
    data remove storage mhdp_core:temp Temp.Pm
