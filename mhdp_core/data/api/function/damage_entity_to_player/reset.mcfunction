#> api:damage_entity_to_player/reset
#
# リセット処理
#
# @input storage api: Arg.

# スコアリセット
    scoreboard players reset #mhdp_temp_damage_total MhdpCore
    scoreboard players reset #mhdp_temp_element_dagame_multiply MhdpCore
    scoreboard players reset #mhdp_temp_element_defence_effective MhdpCore
    scoreboard players reset #mhdp_temp_guard_value MhdpCore
    scoreboard players reset #mhdp_temp_guard_value_original MhdpCore
    scoreboard players reset #mhdp_temp_knockback_strength MhdpCore

# 攻撃者、対象の解放
    # tag @e[tag=Temp.Victim] remove Temp.Victim
    # tag @s remove Temp.Attacker

# 引数の解放
    data remove storage api: Arg
