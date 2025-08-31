#> mhdp_items:player/build/climb
#
# 建造物よじ登り
#
# @within function mhdp_core:player/tick

# 演出
    playsound block.ladder.step master @s ~ ~ ~ 0.5 1

# 移動
    tp @s @s
    scoreboard players set $strength player_motion.api.launch 5000
    execute rotated ~ -90 run function player_motion:api/launch_looking

# クールタイム設定
    scoreboard players set @s Ply.Timer.ClimbBuild 3
