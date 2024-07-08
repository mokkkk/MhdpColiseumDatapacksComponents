#> mhdp_items:core/util/macro/m.item_modify_draw_sub
# 
# 共通処理 納刀時のアイテム更新処理
#
# @within function mhdp_items:core/util/item_modify_draw

# アイテム書き換え
    $item modify entity @s weapon.$(Slot) [{"function": "minecraft:set_name","entity": "this","target": "custom_name","name": ""},{function:set_custom_data,tag:{IsDrawing:1b,IsMhdpWeapon:1b,IsSubWeapon:1b,IsUsing:1b}},{function: set_components, components:{custom_model_data:$(Cmd),hide_tooltip:{}}}]
