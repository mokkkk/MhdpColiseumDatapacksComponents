#> mhdp_items:weapons/bow/type_normal/0_drawattack/start
#
# 抜刀攻撃 開始
#
# @within function mhdp_items:weapons/bow/type_normal/main

# メインハンドが空の場合のみ実行
    execute if items entity @s weapon.mainhand * run return 0

# 強制抜刀
    function mhdp_items:player/weapon/sheathe/force_drawing

# 空中：飛燕撃ちに移行
    execute if entity @s[tag=!Ply.Flag.SpJumpAttack] align y if block ~ ~-0.5 ~ #mhdp_core:no_collision if block ~ ~-1.5 ~ #mhdp_core:no_collision if block ~ ~-2.5 ~ #mhdp_core:no_collision run function mhdp_items:weapons/bow/type_normal/14_air_shot/start

# 通常：溜めに移行
    execute if entity @s[tag=!Wpn.Bw.Normal.Shot.Air,tag=!Itm.Sp.Wirebug.Using] run function mhdp_items:weapons/bow/type_normal/1_charge/start

# 翔蟲：飛翔睨み撃ちに移行
    execute if entity @s[tag=Itm.Sp.Wirebug.Using] run function mhdp_items:weapons/bow/type_normal/10_flying_shot/start

# チュートリアル用処理
    tag @s remove Ply.Temp.Tutorial.DrawAttack
