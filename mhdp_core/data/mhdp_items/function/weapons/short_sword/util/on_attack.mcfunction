#> mhdp_items:weapons/short_sword/util/on_attack
#
# 武器の与ダメージ時処理
#
# @within function mhdp_items:core/switch/macro/m.on_attack

# 狩技ゲージ上昇
    function api:weapon_operation/charge_arts.m with storage api: Return

# 終了
    data remove storage api: Return
