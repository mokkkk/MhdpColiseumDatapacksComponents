#> mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_wing_l_start/main
#
# アニメーションイベントハンドラ 怯み・頭
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 2..5 at @s run tp @s ^-0.2 ^ ^-0.5 ~-2 ~
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 6..9 at @s run tp @s ^ ^ ^-0.2 ~-2 ~
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 10..18 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 20..30 at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 31..37 at @s run tp @s ^ ^ ^-0.3

# 効果音
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1 0.4
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 0.8 0.4
    
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 20 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 20 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 30..36 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 30..36 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 10
    
# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 形態変化
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 1 run tag @s remove Mns.Valk.State.IsShoot

# 終了
    execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 37 run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_wing_l_start/end
