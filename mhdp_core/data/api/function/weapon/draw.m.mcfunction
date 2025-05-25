#> api:weapon/draw.m
#
# 武器抜刀時の処理
#
# @input storage api: Arg.Slot 対象のSlot、mainhandまたはoffhand
# @input storage api: Arg.Cmd CusmonModelDataに指定する値

# 武器にのみ実行する
    execute unless entity @s[type=player] run return run function api:weapon/error {Message:"ERROR: 実行者がプレイヤーではありません"}
    $execute unless items entity @s weapon.$(Slot) ender_eye[] run return run function api:weapon/error {Message:"ERROR: 対象のスロットが武器ではありません"}

# アイテム書き換え
    $item modify entity @s weapon.$(Slot) [{function: set_custom_model_data, strings:{values :["$(Cmd)"], mode: replace_all}} ,{function: set_custom_data,tag:{IsDrawing:1b}},{"function":"minecraft:set_name","entity":"this","name":{"text":" ","type":"text"},"target":"custom_name"}]

# 終了
    data remove storage mhdp_core:temp Args
