#> mhdp_items:player/weapon/move_jump/jump_off
#
# 移動ジャンプ 飛び降り時
#
# @within function mhdp_items:player/weapon/tick

# 演出
    playsound block.grass.step player @s ~ ~ ~ 2 1

# 移動
    tp @s @s
    scoreboard players set $strength player_motion.api.launch 6000
    $execute rotated as @s rotated ~$(Direction) -60 run function player_motion:api/launch_looking

# 移動ジャンプ終了
    scoreboard players set @s Wpn.DeactivateTimer 0
    scoreboard players set @s Ply.Timer.VectorJumpCoolTime 0
    attribute @s movement_speed modifier remove mhdp_core:movejump_movement_speed
    attribute @s jump_strength modifier remove mhdp_core:movejump_jump_strength
