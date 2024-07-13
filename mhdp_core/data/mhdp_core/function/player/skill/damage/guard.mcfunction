#> mhdp_core:player/skill/damage/guard
#
# ガード値の数値増減
#
# @within function mhdp_core:player/damage/entity_to_player/guard/main

# ガード性能
    execute if entity @s[tag=Skill.Defence.Guard.Guard.1] run scoreboard players add #mhdp_temp_guard_strength MhdpCore 1
    execute if entity @s[tag=Skill.Defence.Guard.Guard.2] run scoreboard players add #mhdp_temp_guard_strength MhdpCore 2
