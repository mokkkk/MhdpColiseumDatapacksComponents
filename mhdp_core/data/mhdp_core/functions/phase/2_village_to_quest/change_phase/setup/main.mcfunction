#> mhdp_core:phase/2_village_to_quest/change_phase/setup/main
#
# クエスト開始処理
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/start_quest

# マップ関連初期化
    # 大闘技場
        execute if data storage mhdp_core:game_data ActiveQuest{Field:"Coliseum"} run function mhdp_core:phase/2_village_to_quest/change_phase/setup/map/coliseum

# データ表示
    # 制限時間表示
        tellraw @a [{"text": "【制限時間は"},{"score":{"name":"#mhdp_quest_timer_max","objective":"MhdpCore"}},{"text": "分です】"}]
    # 制限時間(分)をtickに直す
        scoreboard players operation #mhdp_quest_timer MhdpCore *= #const_60 Const
        scoreboard players operation #mhdp_quest_timer MhdpCore *= #const_20 Const
        
# クエスト開始
    data modify storage mhdp_core:game_data ActiveQuest.State set value "Playing"
