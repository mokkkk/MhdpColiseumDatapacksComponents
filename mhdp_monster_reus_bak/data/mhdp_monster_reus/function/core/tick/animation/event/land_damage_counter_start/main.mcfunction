#> mhdp_monster_reus:core/tick/animation/event/land_damage_counter_start/main
#
# アニメーションイベントハンドラ 相殺怯み
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.land_damage_counter_start.frame matches 2..8 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.land_damage_counter_start.frame matches 17..20 at @s run tp @s ^ ^ ^-0.6
    execute if score @s aj.land_damage_counter_start.frame matches 21..33 at @s run tp @s ^ ^ ^-0.4

# 効果音
    execute if score @s aj.land_damage_counter_start.frame matches 2 run playsound entity.ravager.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.land_damage_counter_start.frame matches 2 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s aj.land_damage_counter_start.frame matches 23 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 5
    execute if score @s aj.land_damage_counter_start.frame matches 23 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_damage_counter_start.frame matches 28..30 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.land_damage_counter_start.frame matches 28..32 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 5
    
# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.land_damage_counter_start.frame matches 34 run function mhdp_monster_reus:core/tick/animation/event/land_damage_counter_start/end
