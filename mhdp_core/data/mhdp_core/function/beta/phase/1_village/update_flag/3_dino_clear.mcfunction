#> mhdp_core:beta/phase/1_village/update_flag/3_dino_clear
#
# ベータ版処理 フラグ更新
#
# @within function mhdp_core:phase/1_village/change_phase/check

# フラグ更新
    data modify storage mhdp_core:save_data Flag.BetaDinoHard set value true

# クエスト更新
    data modify storage mhdp_core:game_data QuestList[{ID:16}].State.Visible set value true

# 通知
    tellraw @a {"text":"\n\n【高難度クエストが解放されました】","color": "gold"}