#> mhdp_core:player/damage/player_to_entity/vfx_calc_offset
#
# プレイヤーからモンスターに対してのダメージ処理 演出
#
# @within function mhdp_core:player/damage/player_to_entity/main

# スライムのサイズ計算
    execute store result score #mhdp_temp_slime_size MhdpCore run data get entity @e[tag=Temp.Victim,limit=1] Size
    scoreboard players add #mhdp_temp_slime_size MhdpCore 1
    scoreboard players operation #mhdp_temp_slime_size MhdpCore *= #const_slime_size Const
    scoreboard players operation #mhdp_temp_slime_size MhdpCore /= #const_2 Const

# オフセット計算
    execute store result storage mhdp_core:temp Arg.OffsetY float 0.0001 run scoreboard players get #mhdp_temp_slime_size MhdpCore
    execute store result storage mhdp_core:temp Arg.OffsetZ float 0.0001 run scoreboard players get #mhdp_temp_slime_size MhdpCore

# 終了
    scoreboard players reset #mhdp_temp_slime_size MhdpCore
