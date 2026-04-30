#> mhdp_items:core/buffering/arts_main
#
# 先行入力の受け付け
#
# @within function mhdp_items:**

# 狩技1
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeySprint] if score @s Ply.Stats.Arts.1 >= @s Ply.Stats.Arts.1.Max run function mhdp_items:core/buffering/arts_1

# 狩技2
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeySprint] if score @s Ply.Stats.Arts.2 >= @s Ply.Stats.Arts.2.Max run function mhdp_items:core/buffering/arts_2

