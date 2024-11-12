#> mhdp_core:beta/phase/1_village/reset_clear_time
#
# ベータ版処理 クリアタイムリセット
#
# @within function mhdp_core:phase/1_village/change_phase/check

# 通知
    playsound ui.button.click master @s ~ ~ ~ 1 1
    tellraw @s {"text":"【クリアタイムを消去しました】"}

# クリアタイムリセット
    setblock -80 71 769 air
    setblock -80 70 769 air
    setblock -80 71 770 air
    setblock -80 70 770 air
    setblock -80 71 771 air
    setblock -80 70 771 air
    setblock -80 71 772 air
    setblock -80 70 772 air
