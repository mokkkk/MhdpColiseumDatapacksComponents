#> mhdp_items:weapons/lance/type_tec/0_drawattack/start
#
# 抜刀攻撃 開始
#
# @within function mhdp_items:weapons/lance/type_tec/main

# メインハンドが空の場合のみ実行
    execute if items entity @s weapon.mainhand * run return 0

# 強制抜刀
    function mhdp_items:player/weapon/sheathe/force_drawing
    tag @s add Ply.Flag.DrawAttack

# 空中：落下突きに移行
    # execute if entity @s[tag=!Ply.Flag.SpJumpAttack] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/short_sword/type_tec/32_fall_spear/start

# 通常：突き1に移行
    execute if entity @s[tag=!Wpn.Lc.Tec.FallSpear,tag=!Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/lance/type_tec/1_spear_1/start

# 翔蟲：流転突きに移行
    execute if entity @s[tag=Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/lance/type_tec/21_spiral_thrust/start

# チュートリアル用処理
    tag @s remove Ply.Temp.Tutorial.DrawAttack
