#> mhdp_items:hunter_note/options/show
#
# ハンターノート操作 オプション
#
# @within function mhdp_core:player/tick

# 初期値
    data modify storage mhdp_core:temp Temp.Dialog set value {\
        MoveJumpOn:"0b", MoveJumpOff:"0b",CameraEffectOn:"0b", CameraEffectOff:"0b",\
        ConfirmCommand:"trigger Ply.Ope.HunterNote.Options set $(OptCameraEffect)$(OptMoveJump)"\
    }

# ジャンプ置き換え
    execute unless entity @s[tag=Ply.Option.DisableMoveJump] run data modify storage mhdp_core:temp Temp.Dialog.MoveJumpOn set value "1b"
    execute if entity @s[tag=Ply.Option.DisableMoveJump] run data modify storage mhdp_core:temp Temp.Dialog.MoveJumpOff set value "1b"

# カメラ効果
    execute unless entity @s[tag=Ply.Option.DisableCameraEffect] run data modify storage mhdp_core:temp Temp.Dialog.CameraEffectOn set value "1b"
    execute if entity @s[tag=Ply.Option.DisableCameraEffect] run data modify storage mhdp_core:temp Temp.Dialog.CameraEffectOff set value "1b"

# 表示
    function mhdp_items:hunter_note/options/show.m with storage mhdp_core:temp Temp.Dialog

# 終了
    data remove storage mhdp_core:temp Temp.Dialog
