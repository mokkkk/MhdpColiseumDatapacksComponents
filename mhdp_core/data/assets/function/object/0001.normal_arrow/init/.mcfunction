#> assets:object/0001.normal_arrow/init/
#
# オブジェクト初期化処理

# 向きの更新
    tp @s ~ ~ ~ ~ ~

# 発射したプレイヤーを保持
    execute store result score @s Ply.Uid run data get storage api: Arg.Override.PlyUid

# 溜め段階設定
    execute store result score @s Wpn.Bw.ChargeCount run data get storage api: Arg.Override.ChargeCount

# 武器の型
    execute if data storage api: Arg.Override{IsTec:true} run tag @s add 1.IsTec

# 矢の飛ぶ速度
    execute if data storage api: Arg.Override{Speed:"A"} run tag @s add 1.Speed.A
    execute if data storage api: Arg.Override{Speed:"B"} run tag @s add 1.Speed.B
    execute if data storage api: Arg.Override{Speed:"C"} run tag @s add 1.Speed.C

# 飛翔睨み撃ちかどうか
    execute if data storage api: Arg.Override{IsFlyingShot:true} run tag @s add 1.IsFlyingShot

# ビン
    execute if data storage api: Arg.Override{Bin:"Strong"} run tag @s add 1.Bin.Strong

say 矢 init
