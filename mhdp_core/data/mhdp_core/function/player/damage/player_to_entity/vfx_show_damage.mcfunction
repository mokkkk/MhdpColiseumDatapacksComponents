#> mhdp_core:player/damage/player_to_entity/vfx_show_damage
#
# プレイヤーからモンスターに対してのダメージ処理 ダメージ表示
#
# @within function mhdp_core:player/damage/player_to_entity/main

# ダメージ表示
    execute unless score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage mhdp_core:temp Arg.Color set value "white"
    execute if score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage mhdp_core:temp Arg.Color set value "#FF6F00"
    execute unless score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage mhdp_core:temp Arg.Scale set value 1.0
    execute if score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage mhdp_core:temp Arg.Scale set value 1.0
    execute store result storage mhdp_core:temp Arg.Damage int 1 run scoreboard players get #mhdp_temp_damage_total MhdpCore
    execute store result storage mhdp_core:temp Arg.RotX int 1 run random value 0..90
    execute store result storage mhdp_core:temp Arg.RotY int 1 run random value 0..359
    execute store result storage mhdp_core:temp Arg.Dist int 1 run random value 0..9
    function mhdp_core:player/damage/player_to_entity/macro/m.summon_damage_text with storage mhdp_core:temp Arg
