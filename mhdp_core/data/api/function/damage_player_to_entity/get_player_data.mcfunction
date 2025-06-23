#> api:damage_player_to_entity/get_player_data
#
# プレイヤーのステータス取得
#
# @input storage api: Arg.

# 攻撃力
    scoreboard players operation #mhdp_temp_attack_value MhdpCore = @s Ply.Stats.AttackValue
# 会心率
    scoreboard players operation #mhdp_temp_crit_value MhdpCore = @s Ply.Stats.CritValue
# 属性値
    scoreboard players operation #mhdp_temp_element_value_fire MhdpCore = @s Ply.Stats.ElementValue.Fire
    scoreboard players operation #mhdp_temp_element_value_water MhdpCore = @s Ply.Stats.ElementValue.Water
    scoreboard players operation #mhdp_temp_element_value_thunder MhdpCore = @s Ply.Stats.ElementValue.Thunder
    scoreboard players operation #mhdp_temp_element_value_ice MhdpCore = @s Ply.Stats.ElementValue.Ice
    scoreboard players operation #mhdp_temp_element_value_dragon MhdpCore = @s Ply.Stats.ElementValue.Dragon
# 状態異常
    scoreboard players operation #mhdp_temp_condition_value_poison MhdpCore = @s Ply.Stats.ConditionValue.Poison
    scoreboard players operation #mhdp_temp_condition_value_paralysis MhdpCore = @s Ply.Stats.ConditionValue.Paralysis
    scoreboard players operation #mhdp_temp_condition_value_bomb MhdpCore = @s Ply.Stats.ConditionValue.Bomb
# 相殺
    scoreboard players set #mhdp_temp_counter_value MhdpCore 0
    execute if entity @s[tag=Ply.Temp.IsCounterDamage] run scoreboard players set #mhdp_temp_counter_value MhdpCore 100
