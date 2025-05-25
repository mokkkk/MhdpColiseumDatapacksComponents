#> mhdp_items:player/knockback/main
#
# アイテム処理 player別に毎tick実行される処理 ノックバック
#
# @within function mhdp_items:player/tick

# 距離
    execute store result score $strength player_motion.api.launch run data get storage mhdp_core:temp PlayerData.KnockbackStrength
    tellraw @a {"nbt":"PlayerData.KnockbackStrength","storage":"mhdp_core:temp"}

# 移動
    summon area_effect_cloud ~ ~ ~ {Tags:["Other.Temp.KnockbackVector"]}
    data modify entity @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1] Rotation set from storage mhdp_core:temp PlayerData.KnockbackVector
    execute at @s rotated as @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1] run function player_motion:api/launch_looking
    kill @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1]
    tellraw @a {"nbt":"PlayerData.KnockbackVector","storage":"mhdp_core:temp"}

# 終了
    data modify storage mhdp_core:temp PlayerData.IsDoKnockback set value false
    data remove storage mhdp_core:temp PlayerData.KnockbackStrength
    data remove storage mhdp_core:temp PlayerData.KnockbackVector
    function mhdp_core:player/data/save_data
