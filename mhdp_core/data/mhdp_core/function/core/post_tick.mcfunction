#> mhdp_core:core/post_tick
#
# 毎tickの終了時に実行される処理
#
# @within function mhdp_core:tick

# ヒット効果音の重複再生対策
    data modify storage mhdp_core:temp IsPlayedHitSound set value false

# プレイヤーのpost_tick処理
    execute as @a run function mhdp_core:player/post_tick
