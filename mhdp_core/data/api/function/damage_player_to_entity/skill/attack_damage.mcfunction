#> api:damage_player_to_entity/skill/attack_damage
#
# ダメージ関連スキル適用
#
# @within function api:damage_player_to_entity

# 会心判定
    # プラス会心
        execute store result score #mhdp_temp_crit_check MhdpCore run random value 1..100
        execute if score #mhdp_temp_crit_value MhdpCore matches 1.. if score #mhdp_temp_crit_value MhdpCore >= #mhdp_temp_crit_check MhdpCore run tag @s add Ply.Temp.IsCrit
    # マイナス会心
        scoreboard players remove #mhdp_temp_crit_check MhdpCore 101
        execute if score #mhdp_temp_crit_value MhdpCore matches ..-1 if score #mhdp_temp_crit_value MhdpCore <= #mhdp_temp_crit_check MhdpCore run tag @s add Ply.Temp.IsCritInverse

# 会心ダメージ倍率適用
    # プラス会心
        execute if entity @s[tag=Ply.Temp.IsCrit,tag=!Skill.Attack.Status.CritBoost.1,tag=!Skill.Attack.Status.CritBoost.2,tag=!Skill.Attack.Status.CritBoost.3] run scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore *= #const_crit_multiply_normal Const
        # 超会心
            execute if entity @s[tag=Ply.Temp.IsCrit,tag=Skill.Attack.Status.CritBoost.1] run scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore *= #const_crit_multiply_lv1 Const
            execute if entity @s[tag=Ply.Temp.IsCrit,tag=Skill.Attack.Status.CritBoost.2] run scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore *= #const_crit_multiply_lv2 Const
            execute if entity @s[tag=Ply.Temp.IsCrit,tag=Skill.Attack.Status.CritBoost.3] run scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore *= #const_crit_multiply_lv3 Const
        execute if entity @s[tag=Ply.Temp.IsCrit] run scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore /= #const_100 Const
    # マイナス会心
        execute if entity @s[tag=Ply.Temp.IsCritInverse] run scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore *= #const_crit_minus_multiply_normal Const
        execute if entity @s[tag=Ply.Temp.IsCritInverse] run scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore /= #const_100 Const

# 属性会心
    execute if entity @s[tag=Ply.Temp.IsCrit,tag=Skill.Attack.Status.CritBoost.Element] run scoreboard players operation #mhdp_temp_damage_element_value MhdpCore *= #const_crit_multiply_element Const
    execute if entity @s[tag=Ply.Temp.IsCrit,tag=Skill.Attack.Status.CritBoost.Element] run scoreboard players operation #mhdp_temp_damage_element_value MhdpCore /= #const_100 Const

# 終了
    scoreboard players reset #mhdp_temp_crit_check MhdpCore
