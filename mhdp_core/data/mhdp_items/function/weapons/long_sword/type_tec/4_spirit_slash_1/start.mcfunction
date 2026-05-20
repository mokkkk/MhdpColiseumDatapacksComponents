#> mhdp_items:weapons/long_sword/type_tec/4_spirit_slash_1/start
#
# 縦斬り 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# 練気確認
    execute if score @s Wpn.Ls.SpiritGauge matches 150.. run tag @s add Wpn.Ls.Tec.Spirit.1
    execute if score @s Wpn.Ls.SpiritGauge matches 150.. run scoreboard players remove @s Wpn.Ls.SpiritGauge 150
    execute unless score @s Wpn.Ls.SpiritGauge matches 150.. run tag @s add Wpn.Ls.Tec.Spirit.Miss

# タグ付与
    tag @s remove Ply.Weapon.NoOpe
