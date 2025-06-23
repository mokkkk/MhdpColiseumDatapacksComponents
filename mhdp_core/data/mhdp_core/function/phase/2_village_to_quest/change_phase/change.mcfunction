#> mhdp_core:phase/2_village_to_quest/change_phase/change
#
# 次Phaseへ遷移
#
# @within function mhdp_core:phase/2_village_to_quest/tick

# クエスト開始処理
    function mhdp_core:phase/2_village_to_quest/change_phase/start_quest

# フェーズ変更
    data modify storage mhdp_core:game_data Phase set value 3
    scoreboard players set #mhdp_core_timer MhdpCore 0

# TODO: 以下デバッグ用のため、いずれ削除
    # scoreboard players set #mhdp_core_timer MhdpCore 0
    # data modify storage mhdp_core:game_data Phase set value 1
    # execute as @a run effect clear @s resistance
    # execute as @a run effect clear @s slowness
    # execute as @a run attribute @s jump_strength modifier remove mhdp_core:quest_jump_strength
