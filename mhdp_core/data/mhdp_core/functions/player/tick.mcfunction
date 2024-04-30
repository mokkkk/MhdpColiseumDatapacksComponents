#> mhdp_core:player/tick
#
# player別に毎tick実行される処理
#
# @within function mhdp_core:tick

# UIDの割り当て
    execute unless entity @s[tag=Ply.State.HasUid] run function mhdp_core:player/data/uid_get

# データ取得
    function mhdp_core:player/data/get_data

# 操作の取得
    function mhdp_core:player/data/get_operation

# クエスト中処理

# 一時タグの消去
    function mhdp_core:player/data/remove_temp_tags
