#> mhdp_items:player/build/climb
#
# 建造物よじ登り
#
# @within function mhdp_core:player/tick

# 移動
    tp @s @s
    scoreboard players set $strength player_motion.api.launch 5000
    execute rotated ~ -90 run function player_motion:api/launch_looking

# クールタイム設定
    scoreboard players set @s Ply.Timer.ClimbBuild 2
