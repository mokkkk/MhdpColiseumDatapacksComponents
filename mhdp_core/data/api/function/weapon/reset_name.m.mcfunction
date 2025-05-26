#> api:weapon/reset_name.m
#
# 武器のcustom_nameを削除する
#
# @input storage api: Arg.Slot 対象のSlot、mainhandまたはoffhand

# 武器にのみ実行する
    execute unless entity @s[type=player] run return run function api:weapon/error {Message:"ERROR: 実行者がプレイヤーではありません"}
    # $execute unless items entity @s weapon.$(Slot) ender_eye[] run return run function api:weapon/error {Message:"ERROR: 対象のスロットが武器ではありません"}

# データ取得
    data modify storage mhdp_core:temp Args.Name set from storage mhdp_core:temp PlayerData.Item.UsingWeapon.components.minecraft:item_name

# アイテム書き換え
    $item modify entity @s weapon.$(Slot) {"function":"minecraft:set_name","entity":"this","name":{"text":" ","type":"text"},"target":"custom_name"}

# 終了
    data remove storage mhdp_core:temp Args
