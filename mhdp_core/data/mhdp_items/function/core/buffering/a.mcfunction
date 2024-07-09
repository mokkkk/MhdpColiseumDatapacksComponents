#> mhdp_items:core/buffering/a
#
# 先行入力の受け付け
#
# @within function mhdp_items:**

# 既に入力中の場合中断
    execute if entity @s[tag=Ply.Ope.Buffering.A] run return 0

# 入力更新
    tag @s add Ply.Ope.Buffering.A
    tag @s remove Ply.Ope.Buffering.B
    tag @s remove Ply.Ope.Buffering.C
    tag @s remove Ply.Ope.Buffering.D
    scoreboard players set @s Ply.Timer.Buffering 7
