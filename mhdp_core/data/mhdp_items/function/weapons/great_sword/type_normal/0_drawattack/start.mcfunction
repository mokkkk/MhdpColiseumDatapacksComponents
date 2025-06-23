#> mhdp_items:weapons/great_sword/type_normal/0_drawattack/start
#
# 抜刀攻撃 開始
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# メインハンドが空の場合のみ実行
    execute if items entity @s weapon.mainhand * run return 0

# 強制抜刀
    function mhdp_items:player/weapon/sheathe/force_drawing

# 通常：抜刀溜めに移行
    execute if entity @s[tag=!Ply.Weapon.UsingArts.1,tag=!Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/great_sword/type_normal/5_charge_draw/start
    execute if entity @s[tag=Ply.Weapon.UsingArts.1,tag=!Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/great_sword/type_normal/18_charge_high_quick/start

# 翔蟲：ハンティングエッジに移行
    execute if entity @s[tag=Ply.Flag.SpJumpAttack] run function mhdp_items:weapons/great_sword/type_normal/10_hunting_edge/start

# チュートリアル用処理
    tag @s remove Ply.Temp.Tutorial.DrawAttack
