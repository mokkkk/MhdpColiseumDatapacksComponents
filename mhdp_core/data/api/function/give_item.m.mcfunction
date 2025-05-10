#> api:give_item.m
#
# 実行者にアイテムをgiveする
#
# @input storage api: Arg.Path 対象アイテムのloot_tableのPath
# @input storage api: Arg.Count 個数

# give
    $loot give @s loot $(Path)

# 終了
    data remove storage api: Arg.Path
    data remove storage api: Arg.Count
