#> mhdp_core:player/tick
#
# player別に毎tick実行される処理
#
# @within function mhdp_core:tick

# UIDの割り当て
    execute unless entity @s[tag=Ply.State.HasUid] run function mhdp_core:player/data/uid_get

# 現データの取得
    function mhdp_core:player/data/get_data

# 操作の取得
    function mhdp_core:player/data/get_operation

# リスポーン時処理

# クエスト中処理

# 操作の初期化
    function mhdp_core:player/data/remove_operation

# 一時タグの消去
    function mhdp_core:player/data/remove_temp_tags

# キャッシュデータの削除
    function mhdp_core:player/data/remove_cache_data
