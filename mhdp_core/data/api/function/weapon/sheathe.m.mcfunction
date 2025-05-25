#> api:weapon/sheathe.m
#
# 武器納刀時の処理
#
# @input storage api: Arg.Slot 対象のSlot、mainhandまたはoffhand

# 武器にのみ実行する
    execute unless entity @s[type=player] run return run function api:weapon/error {Message:"ERROR: 実行者がプレイヤーではありません"}
    $execute unless items entity @s weapon.$(Slot) ender_eye[] run return run function api:weapon/error {Message:"ERROR: 対象のスロットが武器ではありません"}

# データ取得
    data modify storage mhdp_core:temp Args.Name set from storage mhdp_core:temp PlayerData.Item.UsingWeapon.components.minecraft:item_name

# アイテム書き換え
    $item modify entity @s weapon.$(Slot) [{function: set_custom_model_data, strings:{values :["sheathe"], mode: replace_all}} ,{function: set_custom_data, tag:{IsDrawing:0b}}]
    $item modify entity @s weapon.$(Slot) {"function":"minecraft:set_name","entity":"this","name":{"storage":"mhdp_core:temp","nbt":"Args.Name","source":"storage","type":"nbt","interpret":true},"target":"custom_name"}
    
# 終了
    data remove storage mhdp_core:temp Args
