#> mhdp_core:tick
#
# 毎tick実行される処理
#
# @within tag/function minecraft:tick

# gameTime取得
    execute store result storage mhdp_core:game_data Time int 1 run time query gametime
