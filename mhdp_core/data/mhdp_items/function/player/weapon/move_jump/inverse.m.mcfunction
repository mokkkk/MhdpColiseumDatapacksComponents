#> mhdp_items:player/weapon/move_jump/inverse.m
#
# 移動ジャンプ
#
# @within function mhdp_items:player/weapon/tick

# 移動
    $scoreboard players set $strength player_motion.api.launch $(Strength)
    $execute rotated ~$(Direction) 0 rotated ~180 0 run function player_motion:api/launch_looking
