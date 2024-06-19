#> mhdp_core:phase/3_quest/change_phase/failed/change
#
# 次Phaseへ遷移 クエスト失敗時の帰還処理
#
# @within function mhdp_core:phase/3_quest/change_phase/failed/wait

# 移動停止を解除
    execute as @a[tag=Ply.State.PlayingQuest] run attribute @s generic.jump_strength modifier remove mhdp_core:quest_jump_strength

# 共通処理
    function mhdp_core:phase/3_quest/change_phase/general/main
