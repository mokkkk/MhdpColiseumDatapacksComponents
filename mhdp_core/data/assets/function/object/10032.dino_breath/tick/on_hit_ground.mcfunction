#> assets:object/10032.dino_breath/tick/on_hit_ground
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# タグ付与
    tag @s add 10032.OnGround

# スコアリセット
    scoreboard players set @s ObjectTick 0
