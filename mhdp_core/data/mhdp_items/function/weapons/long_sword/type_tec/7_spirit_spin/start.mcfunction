#> mhdp_items:weapons/long_sword/type_tec/7_spirit_spin/start
#
# 気刃大回転斬り 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ls.Tec.Spirit.Spin
    scoreboard players remove @s Wpn.Ls.SpiritGauge 200
    tag @s remove Ply.Weapon.NoOpe
