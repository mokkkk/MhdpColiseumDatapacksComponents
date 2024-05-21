#> mhdp_items:weapons/great_sword/util/end_attack
#
# 大剣攻撃終了時の共通処理
#
# @within function mhdp_items:core/*

# アニメーションリセット
    data modify storage mhdp_core:temp Args.IsDrawing set value true
    scoreboard players set #mhdp_arg_cmd_offset MhdpCore 1
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"
    function mhdp_items:core/util/item_modify_animation

# attributeリセット
    attribute @s generic.attack_speed modifier remove f-f-f-a-1
    attribute @s generic.attack_speed modifier add f-f-f-a-1 "武器の個別攻撃速度" -3.0 add_value
    attribute @s generic.jump_strength modifier remove f-f-f-a-3
    effect clear @s slowness
