#> mhdp_monster_valk:core/tick/animation/event/lance_damage_tail_break/main
#
# アニメーションイベントハンドラ 怯み・尻尾
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.lance_damage_tail_break.frame matches 2..9 at @s run tp @s ^ ^ ^1 ~-2 ~
    execute if score @s aj.lance_damage_tail_break.frame matches 10..19 at @s run tp @s ^-0.2 ^ ^0.9 ~-5 ~
    execute if score @s aj.lance_damage_tail_break.frame matches 20..29 at @s run tp @s ^ ^ ^0.4 ~-2 ~
    execute if score @s aj.lance_damage_tail_break.frame matches 30..39 at @s run tp @s ^ ^ ^0.1 ~-1 ~
    execute if score @s aj.lance_damage_tail_break.frame matches 43..54 at @s run tp @s ^ ^ ^ ~-10 ~

# 効果音
    execute if score @s aj.lance_damage_tail_break.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1 0.4
    execute if score @s aj.lance_damage_tail_break.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_damage_tail_break.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 0.8 0.4
    
    execute if score @s aj.lance_damage_tail_break.frame matches 14 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_damage_tail_break.frame matches 14 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_damage_tail_break.frame matches 14..26 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_damage_tail_break.frame matches 14..26 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 6
    execute if score @s aj.lance_damage_tail_break.frame matches 39 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_damage_tail_break.frame matches 39 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_damage_tail_break.frame matches 54 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_damage_tail_break.frame matches 54 run particle block{block_state:"minecraft:sand"} ^-3 ^ ^3.7 0.5 0.1 0.5 0 5
    execute if score @s aj.lance_damage_tail_break.frame matches 59 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_damage_tail_break.frame matches 59 run particle block{block_state:"minecraft:sand"} ^3 ^ ^3.7 0.5 0.1 0.5 0 5
    execute if score @s aj.lance_damage_tail_break.frame matches 63 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 形態変化
    execute if score @s aj.lance_damage_tail_break.frame matches 1 run tag @s remove Mns.Valk.State.IsShoot

# 終了
    execute if score @s aj.lance_damage_tail_break.frame matches 84 run function mhdp_monster_valk:core/tick/animation/event/lance_damage_tail_break/end
