#> api:damage_entity_to_player/skill/guard
#
# ダメージ関連スキル適用 ガード時
#
# @within function api:damage_entity_to_player

# ガード性能
    execute if entity @s[tag=Skill.Defence.Guard.Guard.1] run scoreboard players add #mhdp_temp_guard_strength MhdpCore 1
    execute if entity @s[tag=Skill.Defence.Guard.Guard.2] run scoreboard players add #mhdp_temp_guard_strength MhdpCore 2
