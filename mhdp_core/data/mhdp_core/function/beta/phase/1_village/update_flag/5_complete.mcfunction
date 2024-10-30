#> mhdp_core:beta/phase/1_village/update_flag/5_complete
#
# ベータ版処理 フラグ更新
#
# @within function mhdp_core:phase/1_village/change_phase/check

# フラグ更新
    data modify storage mhdp_core:save_data Flag.BetaComplete set value true

# 通知
    title @a times 5 40 5
    title @a subtitle {"text":"【全てのクエストをクリアしました。おめでとうございます！】","color": "gold","bold": true}
    title @a title {"text":"","color": "gold"}
    advancement grant @a only adventure/kill_a_mob
    execute as @a at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~ 1 1
