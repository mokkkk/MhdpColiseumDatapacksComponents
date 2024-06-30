#> mhdp_core:phase/2_village_to_quest/start/quest_member
#
# 村→クエスト移行時の開始処理 クエスト参加者に対しての実行
#
# @within function mhdp_core:phase/2_village_to_quest/start/main

# チーム移行
    team join Team.QuestPlaying @s

# 移動を禁止
    effect give @s resistance 10 10 true
    effect give @s slowness 10 10 true
    attribute @s generic.jump_strength modifier add mhdp_core:quest_jump_strength -10 add_value

# データ操作準備
    function mhdp_core:player/data/load_data
    data modify storage mhdp_core:temp TempPlayerData set from entity @s

# 武器データを保持し、武器を外す
    function mhdp_core:player/data/items/get_data_items
    data modify storage mhdp_core:temp PlayerData.Item.MainWeapon set from storage mhdp_core:temp PlayerData.Item.Offhand
    data remove storage mhdp_core:temp PlayerData.Item.Offhand
    item replace entity @s weapon.offhand with air

# TODO:防具の固定

# 適用
    function mhdp_core:player/data/save_data

# 終了
    data remove storage mhdp_core:temp TempPlayerData
