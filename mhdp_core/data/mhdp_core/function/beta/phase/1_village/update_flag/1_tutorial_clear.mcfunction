#> mhdp_core:beta/phase/1_village/update_flag/1_tutorial_clear
#
# ベータ版処理 フラグ更新
#
# @within function mhdp_core:phase/1_village/change_phase/check

# フラグ更新
    data modify storage mhdp_core:save_data Flag.BetaTutorial set value true
    data modify storage mhdp_core:save_data Flag.BetaRanposuHard set value true

# クエスト更新
    data modify storage mhdp_core:game_data QuestList[{ID:10}].State.Visible set value true
    data modify storage mhdp_core:game_data QuestList[{ID:11}].State.Visible set value true
    data modify storage mhdp_core:game_data QuestList[{ID:12}].State.Visible set value true
    data modify storage mhdp_core:game_data QuestList[{ID:13}].State.Visible set value true
    data modify storage mhdp_core:game_data QuestList[{ID:14}].State.Visible set value true

# 通知
    tellraw @a {"text":"\n\n【天ノ型が選択できるようになりました】","color": "gold"}
