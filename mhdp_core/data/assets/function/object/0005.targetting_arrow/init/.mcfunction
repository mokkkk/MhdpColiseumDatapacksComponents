#> assets:object/0005.targetting_arrow/init/
#
# オブジェクト初期化処理

# 向きの更新
    tp @s ~ ~ ~ ~ ~

# 発射したプレイヤーを保持
    execute store result score @s Ply.Uid run data get storage api: Arg.Override.PlyUid

# ターゲットを保持
    execute store result score @s Wpn.Bw.HormingTarget run data get storage api: Arg.Override.TargetUid

# 武器の型
    execute if data storage api: Arg.Override{IsTec:true} run tag @s add 5.IsTec

# ビン
    execute if data storage api: Arg.Override{Bin:"Strong"} run tag @s add 5.Bin.Strong
