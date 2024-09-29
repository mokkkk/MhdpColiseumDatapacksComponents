#> mhdp_items:weapons/bow/type_tec/general_get_horming_target
#
# 共通処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# ターゲット取得
    scoreboard players operation #mhdo_temp_uuid MhdpCore = @s Wpn.Bw.HormingTarget
    execute as @e[type=slime,tag=Mns.HitBox] if score @s Entity.Uuid = #mhdo_temp_uuid MhdpCore run tag @s add Temp.Horming.Target

# 演出
    execute at @e[type=slime,tag=Mns.HitBox,tag=Temp.Horming.Target] run particle electric_spark ~ ~ ~ 1 1 1 0.1 2

# 終了
    tag @e[tag=Temp.Horming.Target] remove Temp.Horming.Target
    scoreboard players reset #mhdo_temp_uuid MhdpCore
