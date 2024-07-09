#> mhdp_items:core/buffering/reset
#
# 先行入力の解除
#
# @within function mhdp_items:**

# 入力解除
    tag @s remove Ply.Ope.Buffering.A
    tag @s remove Ply.Ope.Buffering.B
    tag @s remove Ply.Ope.Buffering.C
    tag @s remove Ply.Ope.Buffering.D
    scoreboard players reset @s Ply.Timer.Buffering
