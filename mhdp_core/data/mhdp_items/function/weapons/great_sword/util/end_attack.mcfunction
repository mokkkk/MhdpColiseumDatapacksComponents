#> mhdp_items:weapons/great_sword/util/end_attack
#
# 大剣攻撃終了時の共通処理
#
# @within function mhdp_items:core/*

# アニメーションリセット
    # 操作取得
        function mhdp_items:weapons/great_sword/util/get_no_ope
    # 無操作の場合、アニメーションをリセット
        data modify storage mhdp_core:temp Args.IsDrawing set value true
        scoreboard players set #mhdp_arg_cmd_offset MhdpCore 1
        data modify storage mhdp_core:temp Args.Slot set value "mainhand"
        execute if entity @s[tag=Ply.Weapon.NoOpe] run function mhdp_items:core/util/item_modify_animation

# attributeリセット
    attribute @s generic.attack_speed modifier remove mhdp_core:weapon_attack_speed
    attribute @s generic.attack_speed modifier add mhdp_core:weapon_attack_speed -3.0 add_value
    attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    attribute @s generic.attack_damage modifier remove mhdp_core:weapon_attack_damage
    attribute @s generic.attack_damage modifier add mhdp_core:weapon_attack_damage 5.0 add_value
    effect clear @s slowness
