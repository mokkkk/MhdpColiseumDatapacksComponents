#> mhdp_items:weapons/long_sword/type_tec/22_iai_spirit_slash/start
#
# 居合抜刀気刃斬り 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    tag @s add Wpn.Ls.Tec.IaiSpiritSlash
    execute unless score @s Wpn.Ls.SpiritLevel matches 3 run scoreboard players set @s Wpn.Ls.SpiritGauge 0
    tag @s remove Ply.Weapon.NoOpe
