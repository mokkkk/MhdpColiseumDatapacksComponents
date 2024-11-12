#> mhdp_core:beta/phase/1_village/update_flag/1_tutorial_clear_sub
#
# ベータ版処理 フラグ更新
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 通知
    title @a times 5 40 5
    title @a subtitle {"text":"【クエストが追加されました】","color": "gold","bold": true}
    title @a title {"text":"","color": "gold"}
    execute as @a at @s run playsound ui.button.click master @s ~ ~ ~ 2 1
