#> mhdp_core:player/damage/skill/attack_status
#
# 攻撃力関連のスキル処理
#
# @within function mhdp_core:tick

# 弱点特攻
    execute if entity @s[tag=Skill.Attack.Status.WeakExploit.1] if score #mhdp_temp_defence_phys MhdpCore matches 45.. run scoreboard players add #mhdp_temp_crit_value MhdpCore 15
    execute if entity @s[tag=Skill.Attack.Status.WeakExploit.2] if score #mhdp_temp_defence_phys MhdpCore matches 45.. run scoreboard players add #mhdp_temp_crit_value MhdpCore 30
    execute if entity @s[tag=Skill.Attack.Status.WeakExploit.3] if score #mhdp_temp_defence_phys MhdpCore matches 45.. run scoreboard players add #mhdp_temp_crit_value MhdpCore 50

# 弱点特攻【属性】
# ついでに属性肉質でダメージを計算する
    # 火
        execute store result score #mhdp_temp_defence_element MhdpCore run data get storage mhdp_core:temp Damage.Defence[3]
        execute if entity @s[tag=Skill.Attack.Status.WeakExploit.Element] if score #mhdp_temp_element_value_fire MhdpCore matches 1.. if score #mhdp_temp_defence_element MhdpCore matches 20.. run scoreboard players add #mhdp_temp_element_value_fire MhdpCore 20
        scoreboard players operation #mhdp_temp_element_value_fire MhdpCore *= #mhdp_temp_defence_element MhdpCore
        scoreboard players operation #mhdp_temp_element_value_fire MhdpCore /= #const_100 Const
    # 水
        execute store result score #mhdp_temp_defence_element MhdpCore run data get storage mhdp_core:temp Damage.Defence[4]
        execute if entity @s[tag=Skill.Attack.Status.WeakExploit.Element] if score #mhdp_temp_element_value_water MhdpCore matches 1.. if score #mhdp_temp_defence_element MhdpCore matches 20.. run scoreboard players add #mhdp_temp_element_value_water MhdpCore 20
        scoreboard players operation #mhdp_temp_element_value_water MhdpCore *= #mhdp_temp_defence_element MhdpCore
        scoreboard players operation #mhdp_temp_element_value_water MhdpCore /= #const_100 Const
    # 雷
        execute store result score #mhdp_temp_defence_element MhdpCore run data get storage mhdp_core:temp Damage.Defence[5]
        execute if entity @s[tag=Skill.Attack.Status.WeakExploit.Element] if score #mhdp_temp_element_value_thunder MhdpCore matches 1.. if score #mhdp_temp_defence_element MhdpCore matches 20.. run scoreboard players add #mhdp_temp_element_value_thunder MhdpCore 20
        scoreboard players operation #mhdp_temp_element_value_thunder MhdpCore *= #mhdp_temp_defence_element MhdpCore
        scoreboard players operation #mhdp_temp_element_value_thunder MhdpCore /= #const_100 Const
    # 氷
        execute store result score #mhdp_temp_defence_element MhdpCore run data get storage mhdp_core:temp Damage.Defence[6]
        execute if entity @s[tag=Skill.Attack.Status.WeakExploit.Element] if score #mhdp_temp_element_value_ice MhdpCore matches 1.. if score #mhdp_temp_defence_element MhdpCore matches 20.. run scoreboard players add #mhdp_temp_element_value_ice MhdpCore 20
        scoreboard players operation #mhdp_temp_element_value_ice MhdpCore *= #mhdp_temp_defence_element MhdpCore
        scoreboard players operation #mhdp_temp_element_value_ice MhdpCore /= #const_100 Const
    # 龍
        execute store result score #mhdp_temp_defence_element MhdpCore run data get storage mhdp_core:temp Damage.Defence[7]
        execute if entity @s[tag=Skill.Attack.Status.WeakExploit.Element] if score #mhdp_temp_element_value_dragon MhdpCore matches 1.. if score #mhdp_temp_defence_element MhdpCore matches 20.. run scoreboard players add #mhdp_temp_element_value_dragon MhdpCore 20
        scoreboard players operation #mhdp_temp_element_value_dragon MhdpCore *= #mhdp_temp_defence_element MhdpCore
        scoreboard players operation #mhdp_temp_element_value_dragon MhdpCore /= #const_100 Const

# 閃転
    scoreboard players operation #mhdp_temp_crit_over100_value MhdpCore = #mhdp_temp_crit_value MhdpCore
    scoreboard players remove #mhdp_temp_crit_over100_value MhdpCore 100
    execute if entity @s[tag=!Skill.Attack.Status.CritConvert.1,tag=!Skill.Attack.Status.CritConvert.2,tag=!Skill.Attack.Status.CritConvert.3] run scoreboard players set #mhdp_temp_crit_over100_value MhdpCore 0
    execute if entity @s[tag=Skill.Attack.Status.CritConvert.1] if score #mhdp_temp_crit_over100_value MhdpCore matches 1.. run scoreboard players operation #mhdp_temp_crit_over100_value MhdpCore /= #const_2 Const
    execute if entity @s[tag=Skill.Attack.Status.CritConvert.3] if score #mhdp_temp_crit_over100_value MhdpCore matches 1.. run scoreboard players operation #mhdp_temp_crit_over100_value MhdpCore /= #const_2 Const
    execute if entity @s[tag=Skill.Attack.Status.CritConvert.3] if score #mhdp_temp_crit_over100_value MhdpCore matches 1.. run scoreboard players operation #mhdp_temp_crit_over100_value MhdpCore *= #const_3 Const
    execute if score #mhdp_temp_crit_over100_value MhdpCore matches 1.. run scoreboard players operation #mhdp_temp_attack_value MhdpCore += #mhdp_temp_crit_over100_value MhdpCore
