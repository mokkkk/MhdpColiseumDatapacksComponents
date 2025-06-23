#> mhdp_items:core/util/item_modify_custom_name
# 
# 共通処理 メインハンド武器のアイテム更新処理
#
# @within function mhdp_items:/**
# @input 
#      mhdp_core:temp PlayerData.Item.UsingWeapon プレイヤーの使用中武器
#      score #mhdp_arg_cmd_offset カスタムモデルデータのオフセット

# データ取得
    execute store result score #mhdo_temp_cmd MhdpCore run data get storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data".ModelOffset
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"
    data modify storage mhdp_core:temp Args.Name set from storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:item_name"

# attribute設定
    attribute @s attack_speed modifier remove mhdp_core:weapon_attack_speed
    attribute @s attack_speed modifier add mhdp_core:weapon_attack_speed -4.0 add_value
    attribute @s attack_damage modifier remove mhdp_core:weapon_attack_damage
    attribute @s attack_damage modifier add mhdp_core:weapon_attack_damage -1.0 add_value

# 実行
    function mhdp_items:core/util/macro/m.item_modify_reset_name with storage mhdp_core:temp Args

# 終了
    data remove storage mhdp_core:temp Args
