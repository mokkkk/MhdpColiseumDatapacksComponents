#> mhdp_core:phase/1_village/change_phase/player/check_weapon
#
# 武器に関するチェック
#
# @within function mhdp_core:phase/1_village/bell/click

# 武器を持っていない場合、エラー
# 武器を2つ以上持っている場合、エラー
    execute store result score #mhdp_count MhdpCore run clear @s ender_eye[custom_data~{IsMhdpWeapon:1b}] 0
    execute unless score #mhdp_count MhdpCore matches 1.. run tag @s add Ply.Temp.Error.HasNotWeapons
    execute if score #mhdp_count MhdpCore matches 2.. run tag @s add Ply.Temp.Error.HasManyWeapons
    execute if entity @s[tag=Ply.Temp.Error.HasNotWeapons] run data modify storage mhdp_core:temp IsError set value true
    execute if entity @s[tag=Ply.Temp.Error.HasManyWeapons] run data modify storage mhdp_core:temp IsError set value true
    scoreboard players reset #mhdp_count MhdpCore

# 武器をオフハンドに持っていない場合、エラー
    execute if entity @s[tag=!Ply.Temp.Error.HasNotWeapons,tag=!Ply.Temp.Error.HasManyWeapons] unless items entity @s weapon.offhand ender_eye[custom_data~{IsMhdpWeapon:1b}] run tag @s add Ply.Temp.Error.HasNotWeaponOffhand
    execute if entity @s[tag=Ply.Temp.Error.HasNotWeaponOffhand] run data modify storage mhdp_core:temp IsError set value true
