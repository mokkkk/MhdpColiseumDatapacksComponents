#> mhdp_monster_ranposu:core/tick/animation/event/damage_counter_start_counter_start/main
#
# アニメーションイベントハンドラ 怯み・相殺
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動
    execute if score @s aj.damage_counter_start.frame matches 2..8 at @s run tp @s ^ ^ ^-0.6
    execute if score @s aj.damage_counter_start.frame matches 9..16 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.damage_counter_start.frame matches 26..34 at @s run tp @s ^ ^ ^-0.4

# 効果音
    execute if score @s aj.damage_counter_start.frame matches 8 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.damage_counter_start.frame matches 8 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.damage_counter_start.frame matches 25 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# まばたき
    execute if score @s aj.damage_counter_start.frame matches 2 run scoreboard players set @s Mns.General.BlinkTimer 20

# 終了
    execute if score @s aj.damage_counter_start.frame matches 34 run function mhdp_monster_ranposu:core/tick/animation/event/damage_counter_start/end
