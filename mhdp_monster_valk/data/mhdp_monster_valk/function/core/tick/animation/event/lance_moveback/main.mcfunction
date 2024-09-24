#> mhdp_monster_valk:core/tick/animation/event/lance_moveback/main
#
# アニメーションイベントハンドラ 車庫入れ
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_moveback.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/lance_moveback/turn_start
    execute if score @s aj.lance_moveback.frame matches 2..15 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate
    execute if score @s aj.lance_moveback.frame matches 2..15 at @s run tp @s ^ ^ ^-0.7
    execute if score @s aj.lance_moveback.frame matches 16..22 at @s run tp @s ^ ^ ^-0.3

# 効果音
    execute if score @s aj.lance_moveback.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_moveback.frame matches 8 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
     execute if score @s aj.lance_moveback.frame matches 2..15 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 2

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_moveback.frame matches 29 run function mhdp_monster_valk:core/tick/animation/event/lance_moveback/end
