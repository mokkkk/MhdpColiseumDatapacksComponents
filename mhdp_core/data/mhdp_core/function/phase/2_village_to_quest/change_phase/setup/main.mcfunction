#> mhdp_core:phase/2_village_to_quest/change_phase/setup/main
#
# クエスト開始処理
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/start_quest

# 使用するデータパックのロード
    data modify storage mhdp_core:temp Monsters set from storage mhdp_core:game_data ActiveQuest.Monsters
    function mhdp_core:phase/2_village_to_quest/start/quest/enable_datapack
    data remove storage mhdp_core:temp Monsters

# マップ関連初期化
    # 大闘技場
        execute if data storage mhdp_core:game_data ActiveQuest{Field:"Coliseum"} run function mhdp_core:phase/2_village_to_quest/change_phase/setup/map/coliseum

# 時刻設定
    execute if data storage mhdp_core:game_data ActiveQuest{Time:"day"} run time set 5000
    execute if data storage mhdp_core:game_data ActiveQuest{Time:"night"} run time set 16000

# モンスター配置
    data modify storage mhdp_core:game_data ActiveQuest.TargetMonsters set from storage mhdp_core:game_data ActiveQuest.Monsters
    function mhdp_core:phase/2_village_to_quest/change_phase/setup/monster/main
    # クエストクリア判定に使用するため、再度データを設定
        data modify storage mhdp_core:game_data ActiveQuest.TargetMonsters set from storage mhdp_core:game_data ActiveQuest.Monsters

# データ表示
    # 制限時間表示
        tellraw @a [{"text": "【制限時間は"},{"score":{"name":"#mhdp_quest_timer_max","objective":"MhdpCore"}},{"text": "分です】"}]
    # 制限時間(分)をtickに直す
        scoreboard players operation #mhdp_quest_timer MhdpCore *= #const_60 Const
        scoreboard players operation #mhdp_quest_timer MhdpCore *= #const_20 Const
    # クリアタイム初期化
        scoreboard players set #mhdp_quest_timer_clear MhdpCore 0

# クエスト開始
    data modify storage mhdp_core:game_data ActiveQuest.State set value "Playing"
