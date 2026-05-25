#> assets:object/0011.spirit_release_slash/init/
#
# オブジェクト初期化処理

# 攻撃したプレイヤーを保持
    execute store result score @s Ply.Uid run data get storage api: Arg.Override.PlyUid

# 攻撃対象を保持
    execute store result score @s Ply.Other.AttackTargetUuid run data get storage api: Arg.Override.TargetUuid
