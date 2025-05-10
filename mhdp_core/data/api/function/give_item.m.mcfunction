#> api:give_item.m
#
# 実行者にアイテムをgiveする
#
# @input storage api: Arg.Path 対象アイテムのloot_tableのPath
# @input storage api: Arg.Count 個数

# 値直接指定時の対応のため、Arg.Countを上書き
    $data modify storage api: Arg.Count set value $(Count)

# give
    $loot give @s loot $(Path)

# 終了
    data remove storage api: Arg
