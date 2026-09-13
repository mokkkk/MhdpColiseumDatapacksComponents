#> assets:object/10045.valk_beam/summon/debug
#
# デバッグ用: 引数を設定してこのオブジェクトを手動召喚する（コマンドとして直接実行する想定）
#
# @within manual

# 引数設定
    data modify storage api: Arg.Override set value {}

# 召喚
    function api:object/summon.m {ObjectId:10045}
