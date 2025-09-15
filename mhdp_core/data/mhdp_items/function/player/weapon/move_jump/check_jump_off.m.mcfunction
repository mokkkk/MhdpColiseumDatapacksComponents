#> mhdp_items:player/weapon/move_jump/check_jump_off.m
#
# 移動ジャンプ
#
# @within function mhdp_items:player/weapon/tick

# 段差飛び降り判定
    $execute rotated ~$(Direction) 0 positioned ^ ^ ^0.3 if block ~ ~-1 ~ #mhdp_core:no_collision positioned ^ ^-1 ^-0.2 unless entity @n[type=shulker,tag=Asset.Build.HitBox,dx=0.01,dy=0.01,dz=0.01] run function mhdp_items:player/weapon/move_jump/jump_off with storage mhdp_core:temp PlayerData.VectorMove
