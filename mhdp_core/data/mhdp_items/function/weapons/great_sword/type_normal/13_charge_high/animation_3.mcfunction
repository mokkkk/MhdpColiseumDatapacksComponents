#> mhdp_items:weapons/great_sword/type_tec/13_charge_high/animation_5
#
# 大溜め アニメーション処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/8_charge_super/main

# データ設定
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 26
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# アニメーション
    function mhdp_items:core/util/item_modify_no_attack

# 演出
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    particle crit ~ ~1 ~ 0 0 0 1 50
