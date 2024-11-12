#> mhdp_items:weapons/great_sword/type_tec/0_drawattack/start
#
# 抜刀攻撃 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# メインハンドが空の場合のみ実行
    execute if items entity @s weapon.mainhand * run return 0

# 強制抜刀
    function mhdp_items:player/weapon/sheathe/force_drawing
    tag @s add Ply.Flag.DrawAttack

# 通常：突進斬りに移行
    execute if entity @s[tag=!Itm.Sp.Wirebug.Using] run function mhdp_items:weapons/short_sword/type_tec/19_moveslash/start

# 翔蟲：飛影に移行
    execute if entity @s[tag=Itm.Sp.Wirebug.Using] run function mhdp_items:weapons/short_sword/type_tec/23_tobikage/start

# チュートリアル用処理
    tag @s remove Ply.Temp.Tutorial.DrawAttack
