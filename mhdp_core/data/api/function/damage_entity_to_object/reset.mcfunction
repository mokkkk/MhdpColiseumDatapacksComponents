#> api:damage_entity_to_object/reset
#
# 攻撃ステータス取得
#
# @input storage api: Arg.

# スコアリセット
    scoreboard players reset #mhdp_temp_object_damage MhdpCore

# 攻撃者、対象の解放
    # tag @e[tag=Temp.Victim] remove Temp.Victim
    # tag @s remove Temp.Attacker

# 引数の解放
    # data remove storage api: Arg
    data remove storage api: Return
