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
        # メイン
            data modify storage mhdp_core:temp Args.IsDrawing set value true
            execute if entity @s[tag=Ply.Weapon.NoOpe] run function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
            execute if entity @s[tag=Ply.Weapon.NoOpe] run function api:weapon/reset_name.m {Slot:"mainhand"}
    # 終了
        tag @s remove Ply.Weapon.NoOpe
        # tag @s remove Ply.Flag.CounterSuccess
        # tag @s remove Ply.Flag.Gs.JustTackle
        # tag @s remove Ply.Weapon.NoMoveJump
        function api:weapon_operation/remove_state_tags
        tag @s remove Ply.Flag.Gs.JustTackle

# attributeリセット
    function mhdp_items:weapons/great_sword/util/set_status

# 先行入力解除
    function mhdp_items:core/buffering/reset
