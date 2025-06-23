#> mhdp_items:player/jump_avoid/main
#
# アイテム処理 player別に毎tick実行される処理 ジャンプ回避
#
# @within function mhdp_items:player/tick

# attributeを取得し、正常値でない場合は処理を行わない
    execute store result score #mhdp_temp_jump_strength MhdpCore run attribute @s jump_strength get 100
    execute if score #mhdp_temp_jump_strength MhdpCore matches ..35 run return run scoreboard players reset #mhdp_temp_jump_strength MhdpCore

# 無敵時間設定
    scoreboard players set @s Ply.Timer.Avoid 3

# 終了
    scoreboard players reset #mhdp_temp_jump_strength MhdpCore
