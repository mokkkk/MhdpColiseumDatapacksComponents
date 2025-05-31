#> mhdp_items:weapons/short_sword/type_tec/20_chargeslash/change_to_jumpslash
#
# 溜め斬り → 駆け上がり斬り
#
# @within function mhdp_items:weapons/short_sword/type_tec/16_just_4/main

    tag @s remove Ply.Flag.Hit
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/21_jumpslash/start
