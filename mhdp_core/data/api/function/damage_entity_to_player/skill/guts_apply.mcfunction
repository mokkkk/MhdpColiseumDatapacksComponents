#> api:damage_entity_to_player/skill/guts_apply
#
# ダメージ関連スキル適用 根性
#
# @within function api:damage_entity_to_player

# ダメージを抑える
    scoreboard players operation #mhdp_temp_damage_total MhdpCore = #mhdp_temp_health MhdpCore
    scoreboard players remove #mhdp_temp_damage_total MhdpCore 100

# 通知
    tellraw @s {"text":"【根性が発動した】"}

# 発動タグ付与
    tag @s add Ply.State.IsUsedGuts
