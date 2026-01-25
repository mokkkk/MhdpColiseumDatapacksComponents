#> mhdp_items:weapons/great_sword/type_tec/33_rage_charge/counter
#
# 震怒竜怨斬 カウンター処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 前処理
    function mhdp_items:weapons/great_sword/util/before_attack

# チャージカウント増加
    execute if score @s Wpn.Gs.ChargeCount matches 0 run scoreboard players add @s Wpn.Gs.ChargeCount 1
    execute if score @s Wpn.Gs.ChargeCount matches ..2 run scoreboard players add @s Wpn.Gs.ChargeCount 1

# 演出
    execute positioned ~ ~1.65 ~ run particle flash{color:[0.300,0.000,0.000,1.00]} ^ ^ ^0.2 0 0 0 0 1
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3
    playsound entity.experience_orb.pickup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.3

# タグ付与
    tag @s add Wpn.Gs.Tec.RageSlash
    tag @s remove Ply.Weapon.NoOpe
