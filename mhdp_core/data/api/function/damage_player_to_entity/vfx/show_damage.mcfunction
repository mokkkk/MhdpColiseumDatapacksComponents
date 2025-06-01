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
    execute store result storage mhdp_core:temp Arg.RotX int 1 run random value 0..150
    execute store result storage mhdp_core:temp Arg.RotY int 1 run random value 0..359
    execute store result storage mhdp_core:temp Arg.Dist int 1 run random value 0..29

# スライムのサイズ計算
    execute store result score #mhdp_temp_slime_size MhdpCore run data get entity @e[tag=Temp.Victim,limit=1] Size
    scoreboard players add #mhdp_temp_slime_size MhdpCore 1
    scoreboard players operation #mhdp_temp_slime_size MhdpCore *= #const_slime_size Const
    scoreboard players operation #mhdp_temp_slime_size MhdpCore /= #const_2 Const

# オフセット計算
    execute store result storage mhdp_core:temp Arg.OffsetY float 0.0001 run scoreboard players get #mhdp_temp_slime_size MhdpCore

# 表示
    function api:damage_player_to_entity/vfx/summon_damage_text.m with storage mhdp_core:temp Arg
