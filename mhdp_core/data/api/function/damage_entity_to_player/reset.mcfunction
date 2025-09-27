#> api:damage_entity_to_player/reset
#
# リセット処理
#
# @input storage api: Arg.

# 一時タグ消去
    # tag @s remove Ply.Temp.IsCrit
    # tag @s remove Ply.Temp.IsCritInverse

# スコアリセット
    scoreboard players reset #mhdp_temp_damage_total MhdpCore
    scoreboard players reset #mhdp_temp_element_dagame_multiply MhdpCore
    scoreboard players reset #mhdp_temp_element_defence_effective MhdpCore
    scoreboard players reset #mhdp_temp_guard_value MhdpCore

# 攻撃者、対象の解放
    # tag @e[tag=Temp.Victim] remove Temp.Victim
    # tag @s remove Temp.Attacker

# 引数の解放
    data remove storage api: Arg
