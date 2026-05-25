#> mhdp_items:weapons/long_sword/type_tec/5_spirit_slash_2/start
#
# 縦斬り 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# 練気確認
    execute unless score @s Wpn.Ls.SpiritLevel matches 3 run tag @s add Wpn.Ls.Tec.Foresight
    execute if score @s Wpn.Ls.SpiritLevel matches 3 run function mhdp_items:weapons/long_sword/type_tec/15_red_foresight/start
    execute unless score @s Wpn.Ls.SpiritLevel matches 3 run scoreboard players set @s Wpn.Ls.SpiritGauge 0

# タグ付与
    tag @s remove Ply.Weapon.NoOpe
