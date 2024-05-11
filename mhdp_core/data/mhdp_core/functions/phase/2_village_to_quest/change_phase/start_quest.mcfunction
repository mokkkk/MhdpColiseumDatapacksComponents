#> mhdp_core:phase/2_village_to_quest/change_phase/start_quest
#
# 次Phaseへ遷移
#
# @within function mhdp_core:phase/2_village_to_quest/tick

# プレイヤーの状態更新
    execute as @a[tag=Ply.State.QuestMember] at @s run function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/main

# クエストのセットアップ
    function mhdp_core:phase/2_village_to_quest/change_phase/setup/main
