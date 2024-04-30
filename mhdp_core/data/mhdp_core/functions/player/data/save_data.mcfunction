#> mhdp_core:player/data/save_data
#
# PlayerDataを個別ストレージに保存する
#
# @within function mhdp_core:player/**

# UID取得
    execute store result storage mhdp_core:temp UID int 1 run scoreboard players get @s Ply.Uid

# 保存処理実行
    function mhdp_core:player/data/macro/m.save_data with storage mhdp_core:temp

# 終了
    data remove storage mhdp_core:temp UID
