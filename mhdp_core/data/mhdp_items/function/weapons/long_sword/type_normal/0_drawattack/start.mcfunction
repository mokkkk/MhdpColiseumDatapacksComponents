#> mhdp_items:weapons/long_sword/type_normal/0_drawattack/start
#
# 抜刀攻撃 開始
#
# @within function mhdp_items:weapons/long_sword/type_normal/main

# メインハンドが空の場合のみ実行
    execute if items entity @s weapon.mainhand * run return 0

# 強制抜刀
    function mhdp_items:player/weapon/sheathe/force_drawing
    tag @s add Ply.Flag.DrawAttack

# 空中：落下突きに移行
    execute if entity @s[tag=!Ply.Flag.SpJumpAttack] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/long_sword/type_normal/23_fall_thrust/start

# 通常：通常攻撃1に移行
    execute if entity @s[tag=!Wpn.Ls.Normal.FallThrust,tag=!Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/long_sword/type_normal/1_normal_1/start

# 翔蟲：飛翔円月斬りに移行
    execute if entity @s[tag=Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/long_sword/type_normal/24_soaring_spirit_slash/start

# チュートリアル用処理
    tag @s remove Ply.Temp.Tutorial.DrawAttack
