#> assets:object/0005.targetting_arrow/tick/get_target
#
# 矢のtick処理
#
# @within assets:object/0005.targetting_arrow/tick/

# ターゲット取得
    scoreboard players operation #mhdp_temp_uid MhdpCore = @s Wpn.Bw.HormingTarget
    execute as @e[type=slime,tag=Mns.HitBox,distance=..80] if score @s Entity.Uuid = #mhdp_temp_uid MhdpCore run tag @s add 5.TargetEntity

# 終了  
    scoreboard players reset #mhdp_temp_uid MhdpCore
