#> mhdp_core:phase/2_village_to_quest/change_phase/setup/main
#
# クエスト開始処理
#
# @within function mhdp_core:phase/2_village_to_quest/change_phase/start_quest

# プレイヤーの状態更新
    execute as @a[tag=Ply.State.QuestMember] at @s run function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/main

# マップ関連初期化
    # 大闘技場
        execute if data storage mhdp_core:game_data ActiveQuest{Field:"Coliseum"} run function mhdp_core:phase/2_village_to_quest/change_phase/setup/map/coliseum

# クエスト開始
    data modify storage mhdp_core:game_data ActiveQuest.State set value "Playing"
