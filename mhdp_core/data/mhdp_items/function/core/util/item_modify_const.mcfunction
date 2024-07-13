#> mhdp_items:core/util/item_modify_const
# 
# 共通処理 武器のアイテム更新処理
#
# @within function mhdp_items:/**
# @input 
#      mhdp_core:temp PlayerData.Item.UsingWeapon プレイヤーの使用中武器
#      score #mhdp_arg_cmd_offset カスタムモデルデータのオフセット

# データ取得
    execute store result storage mhdp_core:temp Args.Cmd int 1 run scoreboard players get #mhdp_arg_cmd_offset MhdpCore
    data modify storage mhdp_core:temp Args.Dummy set from storage mhdp_core:game_data Time

# 実行
    function mhdp_items:core/util/macro/m.item_modify_only_cmd with storage mhdp_core:temp Args

# 終了
    data remove storage mhdp_core:temp Args
