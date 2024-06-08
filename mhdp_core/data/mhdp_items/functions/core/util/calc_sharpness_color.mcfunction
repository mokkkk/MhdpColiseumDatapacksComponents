#> mhdp_items:core/util/calc_sharpness_color
# 
# 共通処理 斬れ味の現在色を取得する
#
# @within function mhdp_items:/**
# @input 
#      mhdp_core:temp Args.SharpnessArray 斬れ味配列
#      mhdp_core:temp Args.CurrentSharpness 現在の斬れ味

# 現在斬れ味の数値化
    execute store result score #mhdp_temp_sharpness_current MhdpCore run data get storage mhdp_core:temp Args.CurrentSharpness

# 斬れ味の計算
    scoreboard players set #mhdp_temp_sum MhdpCore 0
    execute store result storage mhdp_core:temp Args.Index int 1 run scoreboard players set #mhdp_temp_index MhdpCore 0
    function mhdp_items:core/util/macro/m.get_sharpness_from_array with storage mhdp_core:temp Args
    scoreboard players reset #mhdp_temp_sum MhdpCore
    scoreboard players reset #mhdp_temp_index MhdpCore

# 終了
    data remove storage mhdp_core:temp Args
