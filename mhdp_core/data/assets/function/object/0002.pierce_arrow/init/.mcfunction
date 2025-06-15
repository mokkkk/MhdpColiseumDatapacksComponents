#> assets:object/0002.pierce_arrow/init/
#
# オブジェクト初期化処理

# 向きの更新
    tp @s ~ ~ ~ ~ ~

# 発射したプレイヤーを保持
    execute store result score @s Ply.Uid run data get storage api: Arg.Override.PlyUid

# 溜め段階設定
    execute store result score @s Wpn.Bw.ChargeCount run data get storage api: Arg.Override.ChargeCount

# 武器の型
    execute if data storage api: Arg.Override{IsTec:true} run tag @s add 2.IsTec
