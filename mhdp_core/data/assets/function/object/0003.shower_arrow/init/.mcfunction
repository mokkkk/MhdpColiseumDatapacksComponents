#> assets:object/0003.shower_arrow/init/
#
# オブジェクト初期化処理

# 向きの更新
    tp @s ~ ~ ~ ~ ~

# 発射したプレイヤーを保持
    execute store result score @s Ply.Uid run data get storage api: Arg.Override.PlyUid

# 武器の型
    execute if data storage api: Arg.Override{IsTec:true} run tag @s add 3.IsTec
