#> api:object/summon.m
#
# オブジェクトを召喚する
#
# @input storage api: Arg.ObjectId 召喚対象のObject
# @input storage api: Arg.Override データ

# 召喚
    $function assets:core/object/summon.m {ObjectId:$(ObjectId)}

# 初期化
    $execute as @n[tag=Asset.Object.Init] run function assets:core/object/init.m {ObjectId:$(ObjectId)}

# 終了
    data remove storage api: Arg
