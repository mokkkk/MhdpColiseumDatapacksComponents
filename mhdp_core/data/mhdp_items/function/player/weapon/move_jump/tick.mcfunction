#> mhdp_items:player/weapon/move_jump/tick
#
# 移動ジャンプ
#
# @within function mhdp_items:player/weapon/tick

# 処理
    scoreboard players remove @s Ply.Timer.VectorJumpCoolTime 1
    execute if score @s Ply.Timer.VectorJumpCoolTime matches 8 at @s run function mhdp_items:player/weapon/move_jump/inverse.m with storage mhdp_core:temp PlayerData.VectorMove
    execute if score @s Ply.Timer.VectorJumpCoolTime matches 6 at @s run function mhdp_items:player/weapon/move_jump/inverse.m with storage mhdp_core:temp PlayerData.VectorMove
    execute if score @s Ply.Timer.VectorJumpCoolTime matches 1 run attribute @s movement_speed modifier remove mhdp_core:movejump_movement_speed
    execute if score @s Ply.Timer.VectorJumpCoolTime matches 1 run attribute @s jump_strength modifier remove mhdp_core:movejump_jump_strength

# 段差飛び降り判定
    function mhdp_items:player/weapon/move_jump/check_jump_off.m with storage mhdp_core:temp PlayerData.VectorMove