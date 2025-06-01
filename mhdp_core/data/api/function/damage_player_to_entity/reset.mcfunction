#> api:damage_player_to_entity/reset
#
# リセット処理
#
# @input storage api: Arg.

# 一時タグ消去
    tag @s remove Ply.Temp.IsCrit
    tag @s remove Ply.Temp.IsCritInverse

# スコアリセット
    scoreboard players reset #mhdp_temp_target_part_id MhdpCore
    scoreboard players reset #mhdp_temp_damage_total MhdpCore
    scoreboard players reset #mhdp_temp_damage_phys_type MhdpCore
    scoreboard players reset #mhdp_temp_damage_phys_value MhdpCore
    scoreboard players reset #mhdp_temp_damage_element_value MhdpCore
    scoreboard players reset #mhdp_temp_damage_partdamage_value MhdpCore
    scoreboard players reset #mhdp_temp_condition_value_poison MhdpCore
    scoreboard players reset #mhdp_temp_condition_value_paralysis MhdpCore
    scoreboard players reset #mhdp_temp_condition_value_bomb MhdpCore
    scoreboard players reset #mhdp_temp_damage_stun_value MhdpCore
    scoreboard players reset #mhdp_temp_damage_tire_value MhdpCore
    scoreboard players reset #mhdp_temp_damage_dragonaura_value MhdpCore
    scoreboard players reset #mhdp_temp_damage_interval MhdpCore

    scoreboard players reset #mhdp_temp_attack_value MhdpCore
    scoreboard players reset #mhdp_temp_defence_phys
    scoreboard players reset #mhdp_temp_damage_sharpness_multiply MhdpCore
    scoreboard players reset #mhdp_temp_element_value_fire MhdpCore
    scoreboard players reset #mhdp_temp_element_value_water MhdpCore
    scoreboard players reset #mhdp_temp_element_value_thunder MhdpCore
    scoreboard players reset #mhdp_temp_element_value_ice MhdpCore
    scoreboard players reset #mhdp_temp_element_value_dragon MhdpCore
    scoreboard players reset #mhdp_temp_element_attack_value MhdpCore
    scoreboard players reset #mhdp_temp_counter_value MhdpCore

# 攻撃者、対象の解放
    tag @e[tag=Temp.Victim] remove Temp.Victim
    tag @s remove Temp.Attacker

# 引数の解放
    data remove storage api: Arg
