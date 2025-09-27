#> api:damage_entity_to_player/calc_element_damage
#
# 属性部ダメージ量計算
#
# @input storage api: Arg.

# 開始
    scoreboard players operation #mhdp_temp_element_damage MhdpCore = #mhdp_temp_damage_total MhdpCore

# 属性ダメージ軽減量計算
# (ダメージ + 属性ダメージ割合) * 属性ダメージ軽減率
    scoreboard players operation #mhdp_temp_element_damage MhdpCore *= #mhdp_temp_element_dagame_multiply MhdpCore
    scoreboard players operation #mhdp_temp_element_damage MhdpCore *= #temp_element_defence_effective MhdpCore
    scoreboard players operation #mhdp_temp_element_damage MhdpCore /= #const_10000 Const

# 実ダメージ計算
# ダメージ - 属性ダメージ軽減量
    scoreboard players operation #mhdp_temp_damage_total MhdpCore -= #mhdp_temp_element_damage MhdpCore
