#> mhdp_items:weapons/great_sword/type_tec/0_drawattack/start
#
# 抜刀攻撃 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# メインハンドが空の場合のみ実行
    execute if items entity @s weapon.mainhand * run return 0

# 強制抜刀
    function mhdp_items:player/weapon/sheathe/force_drawing

# 空中：空中溜めに移行
    execute if entity @s[tag=!Ply.Flag.SpJumpAttack] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/great_sword/type_tec/21_charge_air/start_with_other

# 通常：抜刀溜めに移行
    execute if entity @s[tag=!Wpn.Gs.Tec.Charge.Air,tag=!Ply.Weapon.UsingArts.1,tag=!Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/great_sword/type_tec/5_charge_draw/start
    execute if entity @s[tag=!Wpn.Gs.Tec.Charge.Air,tag=Ply.Weapon.UsingArts.1,tag=!Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/great_sword/type_tec/18_charge_high_quick/start

# 翔蟲：ハンティングエッジに移行
    execute if entity @s[tag=Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/great_sword/type_tec/10_hunting_edge/start

# チュートリアル用処理
    tag @s remove Ply.Temp.Tutorial.DrawAttack
