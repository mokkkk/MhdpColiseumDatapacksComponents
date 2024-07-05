#> mhdp_core:player/damage/entity_to_player/skill/guts
#
# モンスターからプレイヤーに対してのダメージ処理 根性発動
#
# @within function mhdp_core:player/damage/entity_to_player/apply

# ダメージを抑える
    scoreboard players operation #mhdp_temp_damage_total MhdpCore = #mhdp_temp_health MhdpCore
    scoreboard players remove #mhdp_temp_damage_total MhdpCore 100

# 通知
    tellraw @s {"text":"【根性が発動した】"}

# 発動タグ付与
    tag @s add Ply.State.IsUsedGuts
