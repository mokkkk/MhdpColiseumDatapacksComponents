#> mhdp_monster_valk:core/tick/animation/event/comet_phase_4/main
#
# アニメーションイベントハンドラ 彗星・着陸
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.comet_phase_4.frame matches 2..10 at @s run tp @s ^0.5 ^ ^-2
    execute if score @s aj.comet_phase_4.frame matches 11..24 at @s run tp @s ^ ^ ^-0.8 ~-5 ~
    execute if score @s aj.comet_phase_4.frame matches 25..40 at @s run tp @s ^ ^ ^-0.2 ~-0.5 ~
    execute if score @s aj.comet_phase_4.frame matches 41..55 at @s run tp @s ^ ^ ^-0.07 ~-0.2 ~

# 効果音
    execute if score @s aj.comet_phase_4.frame matches 2 run stopsound @a[tag=Ply.State.MnsTarget] master
    execute if score @s aj.comet_phase_4.frame matches 2 run playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.comet_phase_4.frame matches 2 run playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    # execute if score @s aj.comet_phase_4.frame matches 2 run playsound minecraft:entity.wither.death master @a ~ ~ ~ 2 0.7
    # execute if score @s aj.comet_phase_4.frame matches 2 run playsound minecraft:entity.wither.death master @a ~ ~ ~ 2 0.8
    execute if score @s aj.comet_phase_4.frame matches 2..55 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/particle
    execute if score @s aj.comet_phase_4.frame matches 11..40 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.comet_phase_4.frame matches 11..40 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 10
    execute if score @s aj.comet_phase_4.frame matches 55 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.comet_phase_4.frame matches 72 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.comet_phase_4.frame matches 72 run particle block{block_state:"minecraft:sand"} ^ ^ ^6 1 0.1 1 0 10

# 無音
    execute if score @s aj.comet_phase_4.frame matches 2..5 run playsound item.trident.thunder master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s aj.comet_phase_4.frame matches 2..5 run playsound item.trident.thunder master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.comet_phase_4.frame matches 5 run tag @a[tag=Ply.State.MnsTarget] add Ply.State.IsSilent
    execute if score @s aj.comet_phase_4.frame matches 65 run tag @a[tag=Ply.State.MnsTarget] remove Ply.State.IsSilent

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.comet_phase_4.frame matches 93 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/end
