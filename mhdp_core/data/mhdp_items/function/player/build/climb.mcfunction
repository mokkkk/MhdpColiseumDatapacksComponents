#> mhdp_items:player/build/climb
#
# 建造物よじ登り
#
# @within function mhdp_core:player/tick

# 空中フラグをONにする
    tag @s add Ply.Ope.IsAir

# 移動ジャンプ終了
    scoreboard players set @s Ply.Timer.VectorJumpCoolTime 0
    attribute @s movement_speed modifier remove mhdp_core:movejump_movement_speed
    attribute @s jump_strength modifier remove mhdp_core:movejump_jump_strength

# 演出
    playsound block.ladder.step master @s ~ ~ ~ 0.5 1

# 移動
    tp @s @s
    scoreboard players set $strength player_motion.api.launch 5000
    execute rotated ~ -90 run function player_motion:api/launch_looking

# クールタイム設定
    scoreboard players set @s Ply.Timer.ClimbBuild 3
