#> mhdp_items:core/util/macro/m.item_modify_draw
# 
# 共通処理 納刀時のアイテム更新処理
#
# @within function mhdp_items:core/util/item_modify_draw

# 武器にのみ実行する
    $execute unless items entity @s weapon.$(Slot) ender_eye[] run return run data remove storage mhdp_core:temp Args

# アイテム書き換え
    $item modify entity @s weapon.$(Slot) [{"function":"minecraft:set_name","target":"custom_name","name":{"text":"$(Name)","color":"green","italic":false}}]

