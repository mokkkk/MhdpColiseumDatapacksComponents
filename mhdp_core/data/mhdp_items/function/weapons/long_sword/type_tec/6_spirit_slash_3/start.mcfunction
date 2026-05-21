#> mhdp_items:weapons/long_sword/type_tec/6_spirit_slash_3/start
#
# 縦斬り 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# 練気確認
    tag @s add Wpn.Ls.Tec.Spirit.3
    scoreboard players remove @s Wpn.Ls.SpiritGauge 150

# タグ付与
    tag @s remove Ply.Weapon.NoOpe
