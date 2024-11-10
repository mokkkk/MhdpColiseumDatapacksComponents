#> mhdp_core:player/phase_village/tick
#
# player別に毎tick実行される処理 クエスト中のみ
#
# @within function mhdp_core:player/tick

# クエストが無い場合or既にクエスト開始されている場合、終了
    execute if data storage mhdp_core:game_data {Phase:3} run function mhdp_core:player/phase_village/cancel_quest
    execute unless entity @a[tag=Ply.State.QuestHost] run function mhdp_core:player/phase_village/cancel_quest
