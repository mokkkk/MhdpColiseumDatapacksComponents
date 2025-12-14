#> api:object/build.m
#
# オブジェクトを召喚する
#
# @input storage api: Arg.ObjectId 召喚対象のObject
# @input storage api: Arg.Override データ

# バリデート実行
    $function assets:core/object/validate.m {ObjectId:$(ObjectId)}

# 実行結果がエラーの場合、償還しない
    execute if data storage api: Return{Valid:false} run tellraw @s {"text":"【建築の設置条件を満たしていません！】",color:"red"}
    execute if data storage api: Return{Valid:false} run return run data remove storage api: Arg

# 召喚
    $function assets:core/object/summon.m {ObjectId:$(ObjectId)}

# 初期化
    $execute as @n[tag=Asset.Object.Init] run function assets:core/object/init.m {ObjectId:$(ObjectId)}

# 終了
    data remove storage api: Arg
