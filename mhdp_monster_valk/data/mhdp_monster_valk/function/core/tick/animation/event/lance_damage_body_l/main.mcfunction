#> mhdp_monster_valk:core/tick/animation/event/lance_damage_body_l/main
#
# アニメーションイベントハンドラ 怯み・胴・腕・脚
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.lance_damage_body_l.frame matches 2..10 at @s run tp @s ^-0.65 ^ ^-0.2 ~-8 ~
    execute if score @s aj.lance_damage_body_l.frame matches 11..16 at @s run tp @s ^-0.2 ^ ^ ~-3 ~
    execute if score @s aj.lance_damage_body_l.frame matches 45..59 at @s run tp @s ^ ^ ^-0.1 ~-1 ~

# 効果音
    execute if score @s aj.lance_damage_body_l.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1 0.4
    execute if score @s aj.lance_damage_body_l.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_damage_body_l.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 0.8 0.4

    execute if score @s aj.lance_damage_body_l.frame matches 29..32 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_damage_body_l.frame matches 29..32 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.0 0.4
    execute if score @s aj.lance_damage_body_l.frame matches 29 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.lance_damage_body_l.frame matches 29 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4

    execute if score @s aj.lance_damage_body_l.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_damage_body_l.frame matches 12 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_damage_body_l.frame matches 12 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_damage_body_l.frame matches 23 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_damage_body_l.frame matches 45 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_damage_body_l.frame matches 59 run function mhdp_monster_valk:core/tick/animation/event/lance_damage_body_l/end
