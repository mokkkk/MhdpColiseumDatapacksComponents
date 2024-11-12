#> mhdp_core:beta/reset_flag
#
# ベータ版処理 フラグをリセット
#
# @within function mhdp_core:phase/1_village/change_phase/check

# クエストリセット
    function mhdp_core:core/init/quests

# フラグリセット
    data modify storage mhdp_core:save_data Flag set value {BetaShowEssential:false, BetaShowOptional:false, BetaTutorial:false, BetaRanposuPlayed:false, BetaReusPlayed:false, BetaDinoPlayed:false, BetaValkPlayed:false,BetaRanposuHard:false, BetaReusHard:false, BetaDinoHard:false, BetaValkHard:false, BetaComplete:false}

# クリアタイムリセット
    function mhdp_core:beta/phase/1_village/reset_clear_time


# 村状態更新
    function mhdp_core:phase/1_village/start/main
