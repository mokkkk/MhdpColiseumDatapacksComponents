#> mhdp_core:player/damage/player_to_entity/reset_sharpness_notify
#
# プレイヤーからモンスターに対してのダメージ処理 斬れ味回復
#
# @within function mhdp_core:player/damage/player_to_entity/reset_sharpness

# 通知
    tellraw @s {"text": "【武器の斬れ味が回復した！】","color": "green"}
