#> mhdp_items:weapons/short_sword/type_tec/22_fall/start
#
# フォールバッシュ 開始
#
# @within function mhdp_items:weapons/short_sword/type_tec/22_fall/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/short_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ss.Tec.Fall

# say 武器操作：片手剣 フォールバッシュ