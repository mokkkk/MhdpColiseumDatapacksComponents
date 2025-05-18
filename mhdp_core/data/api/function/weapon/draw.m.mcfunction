#> api:weapon/draw
#
# 武器抜刀時の処理
#
# @input storage api: Arg.Slot 対象のSlot、mainhandまたはoffhand
# @input storage api: Arg.Cmd CusmonModelDataに指定する値

# 武器にのみ実行する
    $execute unless items entity @s weapon.$(Slot) ender_eye[] run return run function api:weapon/error {Message:"ERROR: 対象のスロットが武器ではありません"}

# アイテム書き換え
    $item modify entity @s weapon.$(Slot) [{function: set_custom_model_data, strings:{values :["$(Cmd)"], mode: replace_all}} ,{function: set_custom_data,tag:{IsDrawing:1b}}]
    
# 終了
    data remove storage mhdp_core:temp Args


# # データ取得
#     execute store result score #mhdo_temp_cmd MhdpCore run data get storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data".ModelOffset
#     execute store result storage mhdp_core:temp Args.Cmd int 1 run scoreboard players operation #mhdo_temp_cmd MhdpCore += #mhdp_arg_cmd_offset MhdpCore
#     data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# # 実行
#     function mhdp_items:core/util/macro/m.item_modify_draw with storage mhdp_core:temp Args
