#> mhdp_items:core/util/item_modify_animation
# 
# 共通処理 メインハンド武器のアイテム更新処理
#
# @within function mhdp_items:/**
# @input 
#      mhdp_core:temp PlayerData.Item.UsingWeapon プレイヤーの使用中武器
#      score #mhdp_arg_cmd_offset カスタムモデルデータのオフセット

# データ取得
    execute store result score #mhdo_temp_cmd MhdpCore run data get storage mhdp_core:temp PlayerData.Item.UsingWeapon.components."minecraft:custom_data".ModelOffset
    execute store result storage mhdp_core:temp Args.Cmd int 1 run scoreboard players operation #mhdo_temp_cmd MhdpCore += #mhdp_arg_cmd_offset MhdpCore
    data modify storage mhdp_core:temp Args.Slot set value "mainhand"

# attribute設定
    attribute @s attack_speed modifier remove mhdp_core:weapon_attack_speed
    attribute @s attack_speed modifier add mhdp_core:weapon_attack_speed -4.0 add_value
    attribute @s attack_damage modifier remove mhdp_core:weapon_attack_damage
    attribute @s attack_damage modifier add mhdp_core:weapon_attack_damage -1.0 add_value

# 実行
    function mhdp_items:core/util/macro/m.item_modify_draw with storage mhdp_core:temp Args

# 終了
    data remove storage mhdp_core:temp Args
