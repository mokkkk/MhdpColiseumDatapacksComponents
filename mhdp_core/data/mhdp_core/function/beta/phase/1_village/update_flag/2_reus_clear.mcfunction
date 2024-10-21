#> mhdp_core:beta/phase/1_village/update_flag/2_reus_clear
#
# ベータ版処理 フラグ更新
#
# @within function mhdp_core:phase/1_village/change_phase/check

# フラグ更新
    data modify storage mhdp_core:save_data Flag.BetaReusHard set value true

# クエスト更新
    data modify storage mhdp_core:game_data QuestList[{ID:15}].State.Visible set value true