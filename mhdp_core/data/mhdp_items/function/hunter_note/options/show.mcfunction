#> mhdp_items:hunter_note/options/show
#
# ハンターノート操作 オプション
#
# @within function mhdp_core:player/tick

# ジャンプ置き換え
    execute unless entity @s[tag=Ply.Option.DisableMoveJump] run data modify storage mhdp_core:temp Temp.Dialog.MoveJump set value "1b"
    execute if entity @s[tag=Ply.Option.DisableMoveJump] run data modify storage mhdp_core:temp Temp.Dialog.MoveJump set value "0b"

# カメラ効果
    execute unless entity @s[tag=Ply.Option.DisableCameraEffect] run data modify storage mhdp_core:temp Temp.Dialog.CameraEffect set value "1b"
    execute if entity @s[tag=Ply.Option.DisableCameraEffect] run data modify storage mhdp_core:temp Temp.Dialog.CameraEffect set value "0b"

# OKボタン実行コマンド
    data modify storage mhdp_core:temp Temp.Dialog.ConfirmCommand set value "type:\"minecraft:dynamic/run_command\",template:\"trigger Ply.Ope.HunterNote.Options set $(OptCameraEffect)$(OptMoveJump)\""

# 表示
    function mhdp_items:hunter_note/options/show.m with storage mhdp_core:temp Temp.Dialog

# 終了
    data remove storage mhdp_core:temp Temp.Dialog
