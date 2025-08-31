#> assets:core/object/build/expand_jump
#
# プレイヤー打ち上げ

# 値設定
    scoreboard players operation $strength player_motion.api.launch = @n[type=item_display,tag=Asset.Build.Root,tag=This] Build.Stats.Height
    # 少し飛距離を伸ばす
        scoreboard players operation $strength player_motion.api.launch *= #const_3 Const

# 打ち上げ
    tp @s @s
    execute rotated ~ -90 run function player_motion:api/launch_looking
