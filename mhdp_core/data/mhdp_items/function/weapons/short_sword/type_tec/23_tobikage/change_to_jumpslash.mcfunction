#> mhdp_items:weapons/short_sword/type_tec/23_tobikage/change_to_jumpslash
#
# 飛影 → 駆け上がり斬り
#
# @within function mhdp_items:weapons/short_sword/type_tec/23_tobikage/main

# タグ消去
    tag @s remove Ply.Flag.Hit
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/17_jumpslash_high/start
