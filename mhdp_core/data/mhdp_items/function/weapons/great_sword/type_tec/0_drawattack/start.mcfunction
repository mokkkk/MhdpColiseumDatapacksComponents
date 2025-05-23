#> mhdp_items:weapons/great_sword/type_tec/0_drawattack/start
#
# 抜刀攻撃 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# メインハンドが空の場合のみ実行
    execute if items entity @s weapon.mainhand * run return 0

# 強制抜刀
    function mhdp_items:player/weapon/sheathe/force_drawing

# 通常：抜刀溜めに移行
    execute if entity @s[tag=!Itm.Sp.Wirebug.Using] run function mhdp_items:weapons/great_sword/type_tec/5_charge_draw/start

# 翔蟲：ハンティングエッジに移行
    execute if entity @s[tag=Itm.Sp.Wirebug.Using] run function mhdp_items:weapons/great_sword/type_tec/10_hunting_edge/start

# チュートリアル用処理
    tag @s remove Ply.Temp.Tutorial.DrawAttack
