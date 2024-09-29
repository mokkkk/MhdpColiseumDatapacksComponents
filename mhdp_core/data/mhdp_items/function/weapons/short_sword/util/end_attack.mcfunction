#> mhdp_items:weapons/short_sword/util/end_attack
#
# 片手剣攻撃終了時の共通処理
#
# @within function mhdp_items:core/*

# アニメーションリセット
    # 操作取得
        function mhdp_items:weapons/short_sword/util/get_no_ope
    # 無操作の場合、アニメーションをリセット
        # メイン
            data modify storage mhdp_core:temp Args.IsDrawing set value true
            scoreboard players set #mhdp_arg_cmd_offset MhdpCore 1
            execute if entity @s[tag=Ply.Weapon.NoOpe] run function mhdp_items:core/util/item_modify_animation
        # サブ
            data modify storage mhdp_core:temp Args.IsDrawing set value true
            scoreboard players set #mhdp_arg_cmd_offset MhdpCore 3
            execute if entity @s[tag=Ply.Weapon.NoOpe] run function mhdp_items:core/util/item_modify_offhand
    # 終了
        tag @s remove Ply.Weapon.NoOpe

# attributeリセット
    function mhdp_items:weapons/short_sword/util/set_status
    effect clear @s slowness

# 先行入力解除
    function mhdp_items:core/buffering/reset
