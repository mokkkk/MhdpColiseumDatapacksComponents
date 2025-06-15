#> mhdp_items:weapons/bow/type_tec/8_horming/get_horming_target
#
# 共通処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# ターゲット取得
    scoreboard players operation #mhdp_temp_uid MhdpCore = @s Wpn.Bw.HormingTarget
    execute as @e[type=slime,tag=Mns.HitBox] if score @s Entity.Uuid = #mhdp_temp_uid MhdpCore run tag @s add Temp.Horming.Target

# 演出
    execute at @e[type=slime,tag=Mns.HitBox,tag=Temp.Horming.Target] run particle electric_spark ~ ~ ~ 1 1 1 0.1 2

# 自分が発射した矢に対して実行
    scoreboard players operation #mhdp_temp_uid MhdpCore = @s Ply.Uid
    execute as @e[type=item_display,tag=Asset.Object,distance=..50] if entity @s[tag=1.IsTec] if score @s Ply.Uid = #mhdp_temp_uid MhdpCore at @s if score @s ObjectTick matches 2..10 run function mhdp_items:weapons/bow/type_tec/8_horming/arrow_horming
    execute as @e[type=item_display,tag=Asset.Object,distance=..50] if entity @s[tag=2.IsTec,tag=!2.HormingEnd] if score @s Ply.Uid = #mhdp_temp_uid MhdpCore at @s if score @s ObjectTick matches 2..10 run function mhdp_items:weapons/bow/type_tec/8_horming/arrow_horming

# 終了
    tag @e[tag=Temp.Horming.Target] remove Temp.Horming.Target
    scoreboard players reset #mhdp_temp_uid MhdpCore
