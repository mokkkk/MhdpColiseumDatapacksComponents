#> api:damage_entity_to_player/knockback_calc_vector_launch.m
#
# モンスターからプレイヤーに対してのダメージ処理 ノックバック
#
# @within function mhdp_core:player/damage/entity_to_player/apply

# 角度計算
    $execute facing entity @s feet rotated ~ -$(LaunchAngle) positioned as @s run tp @n[type=area_effect_cloud,tag=Other.Temp.KnockbackVector,distance=..10,sort=nearest,limit=1] ~ ~ ~ ~ ~
