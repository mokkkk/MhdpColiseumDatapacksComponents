#> mhdp_items:core/util/item_modify_draw
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

# 実行
    function mhdp_items:core/util/macro/m.item_modify_draw with storage mhdp_core:temp Args

# 終了
    data remove storage mhdp_core:temp Args
