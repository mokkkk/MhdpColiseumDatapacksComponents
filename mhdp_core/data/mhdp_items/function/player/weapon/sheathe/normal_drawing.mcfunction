#> mhdp_items:player/weapon/sheathe/normal_drawing
#
# 通常抜刀
#
# @within function mhdp_items:player/weapon/sheathe/main

# 武器のデータ更新
    # data modify storage mhdp_core:temp Args.IsDrawing set value true
    # scoreboard players set #mhdp_arg_cmd_offset MhdpCore 1
    # data modify storage mhdp_core:temp Args.Slot set value "mainhand"
    # function mhdp_items:core/util/item_modify_draw
    function api:weapon/draw.m {Slot:"mainhand", Cmd:"drawing"}

# 各武器の通常抜刀処理実行
    function mhdp_items:core/switch/weapon_normal_drawing

# タグ付与
    tag @s add Ply.Weapon.Drawing

# 空中で抜刀した場合
    execute if entity @s[tag=Ply.Ope.IsFlying] run tag @s add Ply.Ope.IsAir

# デバッグ用
    execute if data storage mhdp_core:game_data {ShowDebugMessage:true} run say 武器共通：通常抜刀
