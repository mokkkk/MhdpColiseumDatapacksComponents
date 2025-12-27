#> mhdp_items:core/buffering/arts_1
#
# 先行入力の受け付け
#
# @within function mhdp_items:**

# 既に入力中の場合中断
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] run return 0

# 入力更新
    tag @s remove Ply.Ope.Buffering.A
    tag @s remove Ply.Ope.Buffering.B
    tag @s remove Ply.Ope.Buffering.C
    tag @s remove Ply.Ope.Buffering.D
    tag @s remove Ply.Ope.Buffering.E
    tag @s remove Ply.Ope.Buffering.F
    tag @s remove Ply.Ope.Buffering.Jump
    tag @s add Ply.Ope.Buffering.Arts1
    tag @s remove Ply.Ope.Buffering.Arts2
    scoreboard players set @s Ply.Timer.Buffering 10
