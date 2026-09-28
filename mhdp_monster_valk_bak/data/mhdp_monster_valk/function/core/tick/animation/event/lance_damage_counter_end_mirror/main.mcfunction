#> mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_end_mirror/main
#
# アニメーションイベントハンドラ 怯み・頭
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_damage_counter_end_mirror.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_damage_counter_end_mirror.frame matches 15 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_damage_counter_end_mirror.frame matches 15 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    
# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_damage_counter_end_mirror.frame matches 22 run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_end_mirror/end
