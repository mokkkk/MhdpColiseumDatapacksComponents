#> mhdp_core:core/on_end_tick
#
# 毎tickの終了時に実行される処理
#
# @within function mhdp_core:tick


# ヒット効果音の重複再生対策
    data modify storage mhdp_core:temp IsPlayedHitSound set value false
