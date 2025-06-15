#> assets:object/0004.horming_arrow/init/
#
# オブジェクト初期化処理

# 向きの更新
    tp @s ~ ~ ~ ~ ~

# 発射したプレイヤーを保持
    execute store result score @s Ply.Uid run data get storage api: Arg.Override.PlyUid
