#> mhdp_items:weapons/short_sword/type_tec/27_charge_spear/change_to_hit_finish
#
# 溜め斬り落とし → 溜め斬り落とし・命中
#
# @within function mhdp_items:weapons/short_sword/type_tec/1_normal_1/main

# タグ消去
    tag @s remove Ply.Flag.Hit

# 対象の処理を実行
    function mhdp_items:weapons/short_sword/type_tec/28_charge_spear_hit/start_finish
