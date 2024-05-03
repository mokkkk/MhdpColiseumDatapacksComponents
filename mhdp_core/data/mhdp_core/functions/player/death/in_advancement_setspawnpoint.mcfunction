#> mhdp_core:player/death/in_advancement_setspawnpoint
#
# player死亡時処理 進捗達成時に実行 スポーン地点を地面に置く
#
# @within function mhdp_core:player/advancement/hurt/entity_hurt_player

# 地面に着くまで再帰
    execute if block ~ ~-1 ~ #mhdp_core:no_collision positioned ~ ~-1 ~ run function mhdp_core:player/death/in_advancement_setspawnpoint
    execute if block ~ ~ ~ #mhdp_core:no_collision unless block ~ ~-1 ~ #mhdp_core:no_collision align y run spawnpoint @s ~ ~ ~
