#> mhdp_monster_valk:core/tick/animation/event/lance_damage_wing_l/main
#
# アニメーションイベントハンドラ 怯み・左翼
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_damage_wing_l.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1 0.4
    execute if score @s aj.lance_damage_wing_l.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_damage_wing_l.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 0.8 0.4
    
    # execute if score @s aj.lance_damage_wing_l.frame matches 14 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    # execute if score @s aj.lance_damage_wing_l.frame matches 14 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_damage_wing_l.frame matches 25 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_damage_wing_l.frame matches 49 run function mhdp_monster_valk:core/tick/animation/event/lance_damage_wing_l/end