#> mhdp_items:hunter_note/show_menu/training/show
#
# ハンターノート操作 メインメニュー 訓練中のメニュー表示
#
# @within function mhdp_core:player/tick

# 初期値
    data modify storage mhdp_core:temp Temp.Dialog set value {\
        ArtsGaugeInfinityOn:"0b", ArtsGaugeInfinityOff:"0b",\
        CameraEffectOn:"0b", CameraEffectOff:"0b",\
        ConfirmCommand:"trigger Ply.Ope.HunterNote.Options set $(OptCameraEffect)$(OptMoveJump)"\
    }

# 狩技ゲージ
    execute unless entity @s[tag=Ply.Option.Training.IsArtsGaugeInfinity] run data modify storage mhdp_core:temp Temp.Dialog.ArtsGaugeInfinityOff set value 1b
    execute if entity @s[tag=Ply.Option.Training.IsArtsGaugeInfinity] run data modify storage mhdp_core:temp Temp.Dialog.ArtsGaugeInfinityOn set value 1b

# 表示
    function mhdp_items:hunter_note/show_menu/training/show.m with storage mhdp_core:temp Temp.Dialog

# 終了
    data remove storage mhdp_core:temp Temp.Dialog
