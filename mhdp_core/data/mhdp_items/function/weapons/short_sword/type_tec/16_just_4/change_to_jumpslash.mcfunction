#> mhdp_items:weapons/short_sword/type_tec/16_just_4/change_to_jumpslash
#
# 通常コンボ1 → 盾攻撃
#
# @within function mhdp_items:weapons/short_sword/type_tec/16_just_4/main

# タグ消去
    tag @s remove Ply.Flag.Hit
    
# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/17_jumpslash_high/start
