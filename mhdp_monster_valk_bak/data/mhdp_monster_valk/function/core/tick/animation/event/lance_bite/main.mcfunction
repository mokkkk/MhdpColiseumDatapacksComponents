#> mhdp_monster_valk:core/tick/animation/event/lance_bite/main
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.lance_bite.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/lance_bite/turn_start
    execute if score @s aj.lance_bite.frame matches 7 run function mhdp_monster_valk:core/tick/animation/event/lance_bite/turn_start
    execute if score @s aj.lance_bite.frame matches 2..12 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.lance_bite.frame matches 21..27 at @s run tp @s ^ ^ ^0.6
    execute if score @s aj.lance_bite.frame matches 28..35 at @s run tp @s ^ ^ ^0.3
    execute if score @s aj.lance_bite.frame matches 36..42 at @s run tp @s ^ ^ ^0.1

# 効果音
    execute if score @s aj.lance_bite.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    
    execute if score @s aj.lance_bite.frame matches 20..23 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_bite.frame matches 20 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_bite.frame matches 20 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.lance_bite.frame matches 21 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.8 0.4
    execute if score @s aj.lance_bite.frame matches 21 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4

    execute if score @s aj.lance_bite.frame matches 20 run function mhdp_monster_valk:core/tick/animation/event/lance_bite/sound
    execute if score @s aj.lance_bite.frame matches 25 run function mhdp_monster_valk:core/tick/animation/event/lance_bite/sound
    execute if score @s aj.lance_bite.frame matches 21..26 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_bite.frame matches 21..26 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 10

    execute if score @s aj.lance_bite.frame matches 42 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_bite.frame matches 63 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.lance_bite.frame matches 23..30 run function mhdp_monster_valk:core/tick/animation/event/lance_bite/attack

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.lance_bite.frame matches 64 run function mhdp_monster_valk:core/tick/animation/event/lance_bite/end
