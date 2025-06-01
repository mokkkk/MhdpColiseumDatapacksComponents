#> api:damage_player_to_entity/vfx/show_damage
#
# ダメージ表示
#
# @within function api:damage_player_to_entity/vfx

# 肉質に応じて文字色を変更
    execute unless score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage mhdp_core:temp Arg.Color set value "white"
    execute if score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage mhdp_core:temp Arg.Color set value "#FF9F20"
    execute unless score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage mhdp_core:temp Arg.Scale set value 1.0
    execute if score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage mhdp_core:temp Arg.Scale set value 1.0

# 表示位置をずらす
    execute store result storage mhdp_core:temp Arg.Damage int 1 run scoreboard players get #mhdp_temp_damage_total MhdpCore
    execute store result storage mhdp_core:temp Arg.RotX int 1 run random value 0..90
    execute store result storage mhdp_core:temp Arg.RotY int 1 run random value 0..359
    execute store result storage mhdp_core:temp Arg.Dist int 1 run random value 0..9

# 表示
    function api:damage_player_to_entity/vfx/summon_damage_text.m with storage mhdp_core:temp Arg
