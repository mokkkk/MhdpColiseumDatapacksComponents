#> mhdp_items:core/util/macro/m.item_modify_only_cmd
# 
# 共通処理 アイテム更新処理、CMDのみ
#
# @within function mhdp_items:core/util/item_modify_sheathe

# 武器にのみ実行する
    $execute unless items entity @s weapon.$(Slot) ender_eye[] run return run data remove storage mhdp_core:temp Args

# アイテム書き換え
    $item modify entity @s weapon.$(Slot) [{"function": "minecraft:set_custom_model_data","value": $(Cmd)}]
