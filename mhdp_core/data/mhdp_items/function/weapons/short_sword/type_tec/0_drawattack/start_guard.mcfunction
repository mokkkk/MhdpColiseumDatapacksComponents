#> mhdp_items:weapons/great_sword/type_tec/0_drawattack/start_guard
#
# 抜刀攻撃 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# メインハンドが空の場合のみ実行
    execute if items entity @s weapon.mainhand * run return 0

# 強制抜刀
    function mhdp_items:player/weapon/sheathe/force_drawing
    tag @s add Ply.Flag.DrawAttack
    
# ガードに移行
    function mhdp_items:weapons/short_sword/type_tec/24_guard/start
