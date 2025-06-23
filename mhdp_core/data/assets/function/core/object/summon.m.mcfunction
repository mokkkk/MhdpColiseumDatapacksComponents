#> assets:core/object/summon.m
#
# オブジェクトtick共通処理
#
# @within function mhdp_core:tick

# summon処理実行
    $function assets:object/alias/$(ObjectId)/summon
    data remove storage mhdp_core:temp Temp
