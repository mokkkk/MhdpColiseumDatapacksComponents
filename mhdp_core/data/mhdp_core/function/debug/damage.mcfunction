#> mhdp_core:debug/damage
#
# デバッグ用処理 プレイヤー個別ストレージの取得

# 取得
    scoreboard players set $strength player_motion.api.launch 10000
    execute as @a at @s rotated ~ -90 run function player_motion:api/launch_looking