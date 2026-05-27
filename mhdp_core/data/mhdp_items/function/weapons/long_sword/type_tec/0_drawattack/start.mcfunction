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
    execute if entity @s[tag=!Ply.Flag.SpJumpAttack] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/start

# 通常：
    # スニーク時、気刃斬りに移行
        execute if entity @s[tag=Ply.Ope.IsSneaking,tag=!Wpn.Lc.Tec.FallSpear,tag=!Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/long_sword/type_tec/4_spirit_slash_1/start

    # 非移動時、縦斬りに移行
        execute if entity @s[tag=!Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsSneaking,tag=!Wpn.Lc.Tec.FallSpear,tag=!Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/long_sword/type_tec/1_normal_1/start
    # 前移動時、踏み込み斬りに移行
        execute if entity @s[tag=Ply.Ope.IsKeyForward,tag=!Ply.Ope.IsSneaking,tag=!Wpn.Lc.Tec.FallSpear,tag=!Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/long_sword/type_tec/10_step_slash/start

# 翔蟲：飛翔円月斬に移行
    execute if entity @s[tag=Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/start

# チュートリアル用処理
    tag @s remove Ply.Temp.Tutorial.DrawAttack
