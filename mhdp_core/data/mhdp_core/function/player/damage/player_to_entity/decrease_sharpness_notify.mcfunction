#> mhdp_core:player/damage/player_to_entity/decrease_sharpness_notify
#
# プレイヤーからモンスターに対してのダメージ処理 斬れ味消耗
#
# @within function mhdp_core:player/damage/player_to_entity/decrease_sharpness

# 通知
    tellraw @s {"text": "【武器の斬れ味が低下した！】"}
    playsound entity.item.break master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    playsound entity.item.break master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
