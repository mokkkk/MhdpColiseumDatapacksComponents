#> mhdp_items:core/util/item_modify_sheathe
# 
# 共通処理 納刀時のアイテム更新処理
#
# @within function mhdp_items:/**
# @input 
#      mhdp_core:temp PlayerData.Item.UsingWeapon プレイヤーの使用中武器

# データ取得
    data modify storage mhdp_core:temp Args.Cmd set from storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data".ModelOffset
    data modify storage mhdp_core:temp Args.Name set from storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:item_name"
    data modify storage mhdp_core:temp Args.Slot set value "offhand"

# 実行
    function mhdp_items:core/util/macro/m.item_modify_sheathe with storage mhdp_core:temp Args

# 終了
    data remove storage mhdp_core:temp Args
