#> api:damage_entity_to_player/skill/guts
#
# ダメージ関連スキル適用 根性
#
# @within function api:damage_entity_to_player

# 根性
    scoreboard players operation #mhdp_temp_health MhdpCore = @s Ply.Health
    scoreboard players operation #mhdp_temp_health MhdpCore *= #const_100 Const
    execute if entity @s[tag=Skill.Extra.Guts,tag=!Ply.State.IsUsedGuts] if data storage mhdp_core:temp Damage{IsDisableGuts:false} if score #mhdp_temp_health MhdpCore matches 800.. if score #mhdp_temp_health MhdpCore <= #mhdp_temp_damage_total MhdpCore run function api:damage_entity_to_player/skill/guts_apply
    scoreboard players reset #mhdp_temp_health MhdpCore
