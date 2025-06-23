#> mhdp_items:weapons/bow/type_tec/7_shot_shower/start
#
# 竜の千々矢 開始
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/bow/util/before_attack

# タグ付与
    tag @s add Wpn.Bw.Normal.Shot.Shower

# say 武器操作：弓 竜の千々矢