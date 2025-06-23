#> mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_3
#
# 溜め アニメーション処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/3_normal_3/main

# アニメーション
    execute unless entity @s[tag=Ply.Ope.IsKeyRight] run function api:weapon/animation.m {Slot:"mainhand", Cmd:"normal_1_4"}
    execute if entity @s[tag=Ply.Ope.IsKeyRight] run function api:weapon/animation.m {Slot:"mainhand", Cmd:"just_2_5"}