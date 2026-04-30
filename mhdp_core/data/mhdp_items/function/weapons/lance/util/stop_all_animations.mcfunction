#> mhdp_items:weapons/lance/util/stop_all_animations
#
# ランスのアニメーション停止
#
# @within function mhdp_items:core/*

# タグprefix設定
    data modify storage mhdp_core:temp Args.TagPrefix set value "Wpn.Lc"

# 共通処理実行
    function mhdp_items:core/util/stop_all_animations
