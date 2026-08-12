#> mhdp_items:hunter_note/show_menu/training_option/show
#
# ハンターノート操作 メインメニュー 訓練所オプション
#
# @within function mhdp_core:player/tick

# 初期値
    data modify storage mhdp_core:temp Temp.Dialog set value {\
        ArtsGaugeInfinityOn:"0b", ArtsGaugeInfinityOff:"0b",\
        SpItemInfinityOn:"0b", SpItemInfinityOff:"0b",\
        KarakuriModeStay:"0b", KarakuriModeAttack:"0b",\
        ConfirmCommand:"trigger Ply.Ope.HunterNote.TrainingOptions set $(OptKarakuriMode)$(OptSpItemInfinity)$(OptArtsGaugeInfinity)"\
    }

# 狩技ゲージ
    execute unless entity @s[tag=Ply.Option.Training.IsArtsGaugeInfinity] run data modify storage mhdp_core:temp Temp.Dialog.ArtsGaugeInfinityOff set value 1b
    execute if entity @s[tag=Ply.Option.Training.IsArtsGaugeInfinity] run data modify storage mhdp_core:temp Temp.Dialog.ArtsGaugeInfinityOn set value 1b

# 特殊装具
    execute unless entity @s[tag=Ply.Option.Training.IsSpItemInfinity] run data modify storage mhdp_core:temp Temp.Dialog.SpItemInfinityOff set value 1b
    execute if entity @s[tag=Ply.Option.Training.IsSpItemInfinity] run data modify storage mhdp_core:temp Temp.Dialog.SpItemInfinityOn set value 1b

# からくり飛竜モード
    execute as @n[type=item_display,tag=Mns.Root.Karakuri] if score @s Mns.General.DummyCounter matches ..0 run data modify storage mhdp_core:temp Temp.Dialog.KarakuriModeStay set value 1b
    execute as @n[type=item_display,tag=Mns.Root.Karakuri] if score @s Mns.General.DummyCounter matches 1.. run data modify storage mhdp_core:temp Temp.Dialog.KarakuriModeAttack set value 1b

# 表示
    function mhdp_items:hunter_note/show_menu/training_option/show.m with storage mhdp_core:temp Temp.Dialog

# 終了
    data remove storage mhdp_core:temp Temp.Dialog
