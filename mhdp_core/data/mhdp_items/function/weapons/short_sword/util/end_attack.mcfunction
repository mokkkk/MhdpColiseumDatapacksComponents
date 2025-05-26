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
            execute if entity @s[tag=Ply.Weapon.NoOpe] run function api:weapon/animation.m {Slot:"mainhand", Cmd:"drawing"}
            execute if entity @s[tag=Ply.Weapon.NoOpe] run function api:weapon/reset_name.m {Slot:"mainhand"}
        # サブ
            execute if entity @s[tag=Ply.Weapon.NoOpe] run function api:weapon/animation.m {Slot:"offhand", Cmd:"drawing_sub"}
    # 終了
        tag @s remove Ply.Weapon.NoOpe

# attributeリセット
    function mhdp_items:weapons/short_sword/util/set_status
    effect clear @s slowness

# 先行入力解除
    function mhdp_items:core/buffering/reset
