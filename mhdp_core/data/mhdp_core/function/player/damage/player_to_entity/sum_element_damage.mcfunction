#> mhdp_core:player/damage/player_to_entity/sum_element_damage
#
# プレイヤーからモンスターに対してのダメージ処理 属性ダメージ合計値の計算
#
# @within function mhdp_core:player/damage/player_to_entity

# 初期値
    scoreboard players set #mhdp_temp_damage_element_value MhdpCore 0
    scoreboard players set #mhdp_temp_damage_element_vfx_type MhdpCore 0
    scoreboard players set #mhdp_temp_damage_element_max MhdpCore 1

# 火
    scoreboard players operation #mhdp_temp_damage_element_value MhdpCore += #mhdp_temp_element_value_fire MhdpCore
    execute if score #mhdp_temp_element_value_fire MhdpCore > #mhdp_temp_damage_element_max MhdpCore run scoreboard players set #mhdp_temp_damage_element_vfx_type MhdpCore 1
    execute if score #mhdp_temp_element_value_fire MhdpCore > #mhdp_temp_damage_element_max MhdpCore run scoreboard players operation #mhdp_temp_damage_element_max MhdpCore = #mhdp_temp_element_value_fire MhdpCore
# 水
    scoreboard players operation #mhdp_temp_damage_element_value MhdpCore += #mhdp_temp_element_value_water MhdpCore
    execute if score #mhdp_temp_element_value_water MhdpCore > #mhdp_temp_damage_element_max MhdpCore run scoreboard players set #mhdp_temp_damage_element_vfx_type MhdpCore 1
    execute if score #mhdp_temp_element_value_water MhdpCore > #mhdp_temp_damage_element_max MhdpCore run scoreboard players operation #mhdp_temp_damage_element_max MhdpCore = #mhdp_temp_element_value_water MhdpCore
# 雷
    scoreboard players operation #mhdp_temp_damage_element_value MhdpCore += #mhdp_temp_element_value_thunder MhdpCore
    execute if score #mhdp_temp_element_value_thunder MhdpCore > #mhdp_temp_damage_element_max MhdpCore run scoreboard players set #mhdp_temp_damage_element_vfx_type MhdpCore 1
    execute if score #mhdp_temp_element_value_thunder MhdpCore > #mhdp_temp_damage_element_max MhdpCore run scoreboard players operation #mhdp_temp_damage_element_max MhdpCore = #mhdp_temp_element_value_thunder MhdpCore
# 氷
    scoreboard players operation #mhdp_temp_damage_element_value MhdpCore += #mhdp_temp_element_value_ice MhdpCore
    execute if score #mhdp_temp_element_value_ice MhdpCore > #mhdp_temp_damage_element_max MhdpCore run scoreboard players set #mhdp_temp_damage_element_vfx_type MhdpCore 1
    execute if score #mhdp_temp_element_value_ice MhdpCore > #mhdp_temp_damage_element_max MhdpCore run scoreboard players operation #mhdp_temp_damage_element_max MhdpCore = #mhdp_temp_element_value_ice MhdpCore
# 龍
    scoreboard players operation #mhdp_temp_damage_element_value MhdpCore += #mhdp_temp_element_value_dragon MhdpCore
    execute if score #mhdp_temp_element_value_dragon MhdpCore > #mhdp_temp_damage_element_max MhdpCore run scoreboard players set #mhdp_temp_damage_element_vfx_type MhdpCore 1
    execute if score #mhdp_temp_element_value_dragon MhdpCore > #mhdp_temp_damage_element_max MhdpCore run scoreboard players operation #mhdp_temp_damage_element_max MhdpCore = #mhdp_temp_element_value_dragon MhdpCore
