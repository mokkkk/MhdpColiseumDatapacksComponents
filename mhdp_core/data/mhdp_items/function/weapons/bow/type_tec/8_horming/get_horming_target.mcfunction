#> mhdp_items:weapons/bow/type_tec/8_horming/get_horming_target
#
# 共通処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# ターゲット取得
    scoreboard players operation #mhdo_temp_uuid MhdpCore = @s Wpn.Bw.HormingTarget
    execute as @e[type=slime,tag=Mns.HitBox] if score @s Entity.Uuid = #mhdo_temp_uuid MhdpCore run tag @s add Temp.Horming.Target

# 演出
    execute at @e[type=slime,tag=Mns.HitBox,tag=Temp.Horming.Target] run particle electric_spark ~ ~ ~ 1 1 1 0.1 2

# 自分が発射した矢に対して実行
    scoreboard players operation #mhdo_temp_uuid MhdpCore = @s Ply.Uid
    execute as @e[type=item_display,tag=Other.Shot] unless entity @s[tag=!Wpn.Bw.Shot.Normal,tag=!Wpn.Bw.Shot.Pierce] if entity @s[tag=!Wpn.Bw.Shot.Pierce.HormingEnd] if score @s Ply.Uid = #mhdo_temp_uuid MhdpCore at @s if score @s Mns.Shot.Timer matches 2.. run function mhdp_items:weapons/bow/type_tec/8_horming/arrow_horming

# 終了
    tag @e[tag=Temp.Horming.Target] remove Temp.Horming.Target
    scoreboard players reset #mhdo_temp_uuid MhdpCore
