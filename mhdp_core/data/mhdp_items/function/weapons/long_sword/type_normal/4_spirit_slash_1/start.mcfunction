#> mhdp_items:weapons/long_sword/type_normal/4_spirit_slash_1/start
#
# 縦斬り 開始
#
# @within function mhdp_items:weapons/long_sword/type_normal/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# 練気確認
    execute if score @s Wpn.Ls.SpiritGauge matches 150.. run tag @s add Wpn.Ls.Normal.Spirit.1
    execute if entity @s[tag=Wpn.Ls.Normal.Spirit.1] run scoreboard players remove @s Wpn.Ls.SpiritGauge 150
    execute unless entity @s[tag=Wpn.Ls.Normal.Spirit.1] run tag @s add Wpn.Ls.Normal.Spirit.Miss

# タグ付与
    tag @s remove Ply.Weapon.NoOpe
