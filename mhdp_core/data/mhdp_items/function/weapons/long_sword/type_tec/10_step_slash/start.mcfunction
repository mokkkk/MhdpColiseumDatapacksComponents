#> mhdp_items:weapons/long_sword/type_tec/10_step_slash/start
#
# 踏み込み斬り 開始
#
# @within function mhdp_items:weapons/long_sword/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/long_sword/util/before_attack

# タグ付与
    execute unless score @s Wpn.Ls.SpiritLevel matches 3 run tag @s add Wpn.Ls.Tec.StepSlash
    execute if score @s Wpn.Ls.SpiritLevel matches 3 run tag @s add Wpn.Ls.Tec.RedNormal.1
    tag @s remove Ply.Weapon.NoOpe
