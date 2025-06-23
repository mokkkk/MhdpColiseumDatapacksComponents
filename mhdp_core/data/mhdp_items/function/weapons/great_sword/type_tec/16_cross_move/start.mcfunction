#> mhdp_items:weapons/great_sword/type_tec/16_cross_move/start
#
# 十字斬り・移動 開始
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Gs.Tec.CrossMove
    tag @s remove Ply.Weapon.NoOpe
    tag @s remove Ply.Flag.CounterSuccess

# say 武器操作：大剣・十字斬り・移動