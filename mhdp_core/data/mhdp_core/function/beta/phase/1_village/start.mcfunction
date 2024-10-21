#> mhdp_core:beta/phase/1_village/start
#
# ベータ版処理 村開始時
#
# @within function mhdp_core:phase/1_village/change_phase/check

# チュートリアルクリア
    execute if data storage mhdp_core:save_data Flag{BetaTutorial:false} if data storage mhdp_core:game_data QuestList[{ID:1}].State{IsCleared:true} run function mhdp_core:beta/phase/1_village/update_flag/1_tutorial_clear

# 高難度クエスト解放
    execute if data storage mhdp_core:save_data Flag{BetaReusHard:false} if data storage mhdp_core:game_data QuestList[{ID:11}].State{IsCleared:true} run function mhdp_core:beta/phase/1_village/update_flag/2_reus_clear
    execute if data storage mhdp_core:save_data Flag{BetaDinoHard:false} if data storage mhdp_core:game_data QuestList[{ID:12}].State{IsCleared:true} run function mhdp_core:beta/phase/1_village/update_flag/3_dino_clear
    execute if data storage mhdp_core:save_data Flag{BetaValkHard:false} if data storage mhdp_core:game_data QuestList[{ID:13}].State{IsCleared:true} run function mhdp_core:beta/phase/1_village/update_flag/4_valk_clear

# 全クエストクリア
    execute if data storage mhdp_core:save_data Flag{BetaComplete:false} \
        if data storage mhdp_core:game_data QuestList[{ID:14}].State{IsCleared:true} \
        if data storage mhdp_core:game_data QuestList[{ID:15}].State{IsCleared:true} \
        if data storage mhdp_core:game_data QuestList[{ID:16}].State{IsCleared:true} \
        if data storage mhdp_core:game_data QuestList[{ID:17}].State{IsCleared:true} \
        run function mhdp_core:beta/phase/1_village/update_flag/5_complete

# 武器UIの設置
    function mhdp_core:beta/phase/1_village/select_weapon/summon
