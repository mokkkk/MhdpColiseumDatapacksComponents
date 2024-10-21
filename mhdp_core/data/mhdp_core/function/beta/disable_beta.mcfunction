#> mhdp_core:beta/disable_beta
#
# ベータ版処理を無効にする
#
# @within function mhdp_core:phase/1_village/change_phase/check

# ベータ版有効
    data modify storage mhdp_core:game_data IsBetaVersion set value false
