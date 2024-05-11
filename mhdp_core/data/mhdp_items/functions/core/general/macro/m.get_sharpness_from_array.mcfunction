#> mhdp_items:core/general/macro/m.get_sharpness_from_array
# 
# 共通処理 斬れ味の現在色を取得する
#
# @within function mhdp_items:/**

# 計算
    $execute store result score #mhdp_temp_sharpness MhdpCore run data get storage mhdp_core:temp Args.SharpnessArray[$(Index)]
    scoreboard players operation #mhdp_temp_sum MhdpCore += #mhdp_temp_sharpness MhdpCore
    scoreboard players reset #mhdp_temp_sharpness MhdpCore

# 確定
    execute if score #mhdp_temp_sharpness_current MhdpCore <= #mhdp_temp_sum MhdpCore run data modify storage mhdp_core:temp Args.Complete set value true
    execute if data storage mhdp_core:temp Args{Complete:true} store result storage mhdp_core:temp Result.SharpnessColor int 1 run scoreboard players get #mhdp_temp_index MhdpCore

# 斬れ味が確定するまで繰り返す
    execute store result storage mhdp_core:temp Args.Index int 1 run scoreboard players add #mhdp_temp_index MhdpCore 1
    execute if score #mhdp_temp_index MhdpCore matches ..7 unless data storage mhdp_core:temp Args{Complete:true} run function mhdp_items:core/general/macro/m.get_sharpness_from_array with storage mhdp_core:temp Args

say color