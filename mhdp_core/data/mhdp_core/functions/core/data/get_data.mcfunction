#> mhdp_core:core/data/get_data
#
# 毎tick実行される処理
#
# @within mhdp_core:tick

# gameTime取得
    execute store result storage mhdp_core:game_data Time int 1 run time query gametime
