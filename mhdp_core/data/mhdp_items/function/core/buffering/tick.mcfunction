#> mhdp_items:core/buffering/tick
#
# 先行入力のtick処理
#
# @within function mhdp_items:**

# 入力更新
    scoreboard players remove @s Ply.Timer.Buffering 1
    execute if score @s Ply.Timer.Buffering matches ..0 run function mhdp_items:core/buffering/reset
