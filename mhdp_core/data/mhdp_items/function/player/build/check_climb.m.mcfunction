#> mhdp_items:player/build/check_climb.m
#
# 建造物よじ登り
#
# @within function mhdp_core:player/tick

# よじ登り
    $execute rotated ~$(Rotate) 0 positioned ^ ^ ^0.3 positioned ~-0.05 ~-0.05 ~-0.05 if entity @n[type=shulker,tag=Asset.Build.HitBox,dx=0.1,dy=0.1,dz=0.1] at @s run function mhdp_items:player/build/climb
