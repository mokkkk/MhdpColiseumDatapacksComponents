#> mhdp_items:weapons/great_sword/type_tec/general
#
# 共通処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 強化納刀
    execute if entity @s[tag=Ply.Weapon.UsingArts.1] run scoreboard players remove @s Ply.Stats.Arts.1 2
    execute if entity @s[tag=Ply.Weapon.UsingArts.1] if score @s Ply.Stats.Arts.1 matches ..0 run tag @s remove Ply.Weapon.UsingArts.1
