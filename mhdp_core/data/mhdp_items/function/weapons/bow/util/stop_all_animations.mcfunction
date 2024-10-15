#> mhdp_items:weapons/bow/util/stop_all_animations
#
# 弓のアニメーション停止
#
# @within function mhdp_items:core/*

# タグprefix設定
    data modify storage mhdp_core:temp Args.TagPrefix set value "Wpn.Bw"

# 共通処理実行
    function mhdp_items:core/util/stop_all_animations
