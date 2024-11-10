#> mhdp_monster_dino:core/tick/animation/event/damage_counter_tail_left_start/main
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 移動
    execute if score @s aj.damage_counter_tail_left_start.frame matches 2..10 at @s run tp @s ^ ^ ^-0.1 ~-5 ~
    execute if score @s aj.damage_counter_tail_left_start.frame matches 11..17 at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.damage_counter_tail_left_start.frame matches 18..28 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.damage_counter_tail_left_start.frame matches 29..36 at @s run tp @s ^ ^ ^-0.4

# 効果音
    execute if score @s aj.damage_counter_tail_left_start.frame matches 2..4 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage_counter_tail_left_start.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.hurt master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.damage_counter_tail_left_start.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.hurt master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.damage_counter_tail_left_start.frame matches 17 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.damage_counter_tail_left_start.frame matches 17 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30
    execute if score @s aj.damage_counter_tail_left_start.frame matches 29..32 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage_counter_tail_left_start.frame matches 29..32 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 5

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.damage_counter_tail_left_start.frame matches 38 run function mhdp_monster_dino:core/tick/animation/event/damage_counter_tail_left_start/end
