#> mhdp_items:weapons/bow/type_normal/0_drawattack/start
#
# 抜刀攻撃 開始
#
# @within function mhdp_items:weapons/bow/type_normal/main

# メインハンドが空の場合のみ実行
    execute if items entity @s weapon.mainhand * run return 0

# 強制抜刀
    function mhdp_items:player/weapon/sheathe/force_drawing

# 通常：溜めに移行
    execute if entity @s[tag=!Itm.Sp.Wirebug.Using] run function mhdp_items:weapons/bow/type_normal/1_charge/start

# 翔蟲：飛翔睨み撃ちに移行
    execute if entity @s[tag=Itm.Sp.Wirebug.Using] run function mhdp_items:weapons/bow/type_normal/10_flying_shot/start

# チュートリアル用処理
    tag @s remove Ply.Temp.Tutorial.DrawAttack
