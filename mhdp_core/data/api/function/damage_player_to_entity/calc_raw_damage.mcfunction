#> api:damage_player_to_entity/calc_raw_damage
#
# ダメージ量計算
#
# @input storage api: Arg.

# 物理ダメージ斬れ味補正
        scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 100
        execute if score @s Ply.Stats.CurrentSharpnessColor matches ..0 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 50
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 1 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 75
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 2 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 100
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 3 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 105
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 4 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 120
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 5 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 132
        execute if score @s Ply.Stats.CurrentSharpnessColor matches 6.. run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 139

# 物理ダメージ計算
    # モーション値取得
        execute store result score #mhdp_temp_damage_phys_value MhdpCore run data get storage api: Arg.DamageMult
    # 攻撃力 * モーション値
        scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore *= #mhdp_temp_attack_value MhdpCore
    # * 斬れ味補正
        scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore *= #mhdp_temp_damage_sharpness_multiply MhdpCore
    # 桁合わせ
        scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore /= #const_10000 Const

# 属性ダメージ斬れ味補正
    scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 100
    execute if score @s Ply.Stats.CurrentSharpnessColor matches ..0 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 50
    execute if score @s Ply.Stats.CurrentSharpnessColor matches 1 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 75
    execute if score @s Ply.Stats.CurrentSharpnessColor matches 2..4 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 100
    execute if score @s Ply.Stats.CurrentSharpnessColor matches 5 run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 115
    execute if score @s Ply.Stats.CurrentSharpnessColor matches 6.. run scoreboard players set #mhdp_temp_damage_sharpness_multiply MhdpCore 125

# 属性
    # 属性ダメージ加算
        function api:damage_player_to_entity/sum_element_damage
    # 属性モーション値取得
        execute store result score #mhdp_temp_element_attack_value MhdpCore run data get storage api: Arg.ElementDamageMult
    # 属性ダメージ * モーション値
        scoreboard players operation #mhdp_temp_damage_element_value MhdpCore *= #mhdp_temp_element_attack_value MhdpCore
    # * 斬れ味補正
        scoreboard players operation #mhdp_temp_damage_element_value MhdpCore *= #mhdp_temp_damage_sharpness_multiply MhdpCore
    # 桁合わせ
        scoreboard players operation #mhdp_temp_damage_element_value MhdpCore /= #const_10000 Const

# 状態異常
    # 2/3の確率で状態異常ダメージを無効化する
        execute if predicate {"condition":"minecraft:random_chance","chance":0.66} run tag @s add Ply.Temp.IsDisableConditionDamage
        execute if entity @s[tag=Ply.Temp.IsDisableConditionDamage] run scoreboard players set #mhdp_temp_condition_value_poison MhdpCore 0
        execute if entity @s[tag=Ply.Temp.IsDisableConditionDamage] run scoreboard players set #mhdp_temp_condition_value_paralysis MhdpCore 0
        execute if entity @s[tag=Ply.Temp.IsDisableConditionDamage] run scoreboard players set #mhdp_temp_condition_value_bomb MhdpCore 0
        execute if entity @s[tag=Ply.Temp.IsDisableConditionDamage] run return run tag @s remove Ply.Temp.IsDisableConditionDamage
    # 状態異常値 * モーション値
        scoreboard players operation #mhdp_temp_condition_value_poison MhdpCore *= #mhdp_temp_element_attack_value MhdpCore
        scoreboard players operation #mhdp_temp_condition_value_poison MhdpCore /= #const_100 Const
        scoreboard players operation #mhdp_temp_condition_value_paralysis MhdpCore *= #mhdp_temp_element_attack_value MhdpCore
        scoreboard players operation #mhdp_temp_condition_value_paralysis MhdpCore /= #const_100 Const
        scoreboard players operation #mhdp_temp_condition_value_bomb MhdpCore *= #mhdp_temp_element_attack_value MhdpCore
        scoreboard players operation #mhdp_temp_condition_value_bomb MhdpCore /= #const_100 Const
