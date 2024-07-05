#> mhdp_items:core/util/macro/m.item_modify_only_cmd
# 
# 共通処理 納刀時のアイテム更新処理
#
# @within function mhdp_items:core/util/item_modify_sheathe

# アイテム書き換え
    $item modify entity @s weapon.$(Slot) [{"function": "minecraft:set_custom_model_data","value": $(Cmd)}]
