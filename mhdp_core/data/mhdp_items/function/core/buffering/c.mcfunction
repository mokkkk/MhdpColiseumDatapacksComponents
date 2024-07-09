#> mhdp_items:core/buffering/c
#
# 先行入力の受け付け
#
# @within function mhdp_items:**

# 既に入力中の場合中断
    execute if entity @s[tag=Ply.Ope.Buffering.C] run return 0

# 入力更新
    tag @s remove Ply.Ope.Buffering.A
    tag @s remove Ply.Ope.Buffering.B
    tag @s add Ply.Ope.Buffering.C
    tag @s remove Ply.Ope.Buffering.D
    scoreboard players set @s Ply.Timer.Buffering 7
