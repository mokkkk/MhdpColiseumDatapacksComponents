#> assets:object/0010.helmbreaker/init/
#
# オブジェクト初期化処理

# 攻撃したプレイヤーを保持
    execute store result score @s Ply.Uid run data get storage api: Arg.Override.PlyUid

# 攻撃対象を保持
    execute store result score @s Ply.Other.AttackTargetUuid run data get storage api: Arg.Override.TargetUuid

# 色を保持
    execute if data storage api: Arg.Override{Color:"White"} run tag @s add 10.IsWhite
    execute if data storage api: Arg.Override{Color:"Yellow"} run tag @s add 10.IsYellow
    execute if data storage api: Arg.Override{Color:"Red"} run tag @s add 10.IsRed
