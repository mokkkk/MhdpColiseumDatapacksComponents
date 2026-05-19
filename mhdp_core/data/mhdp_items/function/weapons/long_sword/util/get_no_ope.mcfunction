#> mhdp_items:weapons/long_sword/util/get_no_ope
#
# 太刀の無操作状態取得
#
# @within function mhdp_items:core/*

# タグprefix設定
    data modify storage mhdp_core:temp Args.TagPrefix set value "Wpn.Ls"

# 共通処理実行
    function mhdp_items:core/util/get_no_ope
