#> api:weapon_operation/looking_move
#
# 向いている方向に移動する

# 建築の上では移動しない
    execute positioned ~ ~-0.5 ~ if entity @n[type=shulker,tag=Asset.Build.HitBox,dx=0.01,dy=0.01,dz=0.01] run return run scoreboard players reset $strength player_motion.api.launch

# 移動
    function player_motion:api/launch_looking
