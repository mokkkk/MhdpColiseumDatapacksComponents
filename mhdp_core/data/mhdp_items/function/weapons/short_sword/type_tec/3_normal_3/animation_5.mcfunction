#> mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_1
#
# 通常コンボ1 アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/3_normal_3/main

# アニメーション
    execute unless entity @s[tag=Ply.Ope.IsKeyRight] run function api:weapon/animation.m {Slot:"mainhand", Cmd:"normal_1_2"}
    execute if entity @s[tag=Ply.Ope.IsKeyRight] run function api:weapon/animation.m {Slot:"mainhand", Cmd:"just_2_3"}
    execute unless entity @s[tag=Ply.Ope.IsKeyRight] run function api:weapon/animation.m {Slot:"offhand", Cmd:"normal_1_sub_1"}
    execute if entity @s[tag=Ply.Ope.IsKeyRight] run function api:weapon/animation.m {Slot:"offhand", Cmd:"just_3_4"}
