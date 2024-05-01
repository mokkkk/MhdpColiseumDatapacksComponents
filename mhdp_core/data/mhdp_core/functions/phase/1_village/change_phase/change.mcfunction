#> mhdp_core:phase/1_village/change_phase/change
#
# 次Phaseへ遷移
#
# @within function mhdp_core:phase/1_village/change_phase/check

# フェーズ変更
    scoreboard players set #mhdp_core_timer MhdpCore 0
    data modify storage mhdp_core:game_data Phase set value 2
