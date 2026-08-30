#> mhdp_monster_valk:core/tick/animation/event/lance_death/main
#
# アニメーションイベントハンドラ 討伐
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_death.frame matches 8 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_death.frame matches 8 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_death.frame matches 27 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_death.frame matches 80..100 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 1.3 0.4
    execute if score @s aj.lance_death.frame matches 80..100 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 1.1 0.4
    execute if score @s aj.lance_death.frame matches 80..100 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.9 0.4
    execute if score @s aj.lance_death.frame matches 80..100 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.1 0.4
    execute if score @s aj.lance_death.frame matches 80..102 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 2
    execute if score @s aj.lance_death.frame matches 132 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_death.frame matches 132 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30

# まばたき
    execute if score @s aj.lance_death.frame matches 120 run scoreboard players set @s Mns.General.BlinkTimer 10000000

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 剝ぎ取り可能
    execute if score @s aj.lance_death.frame matches 132 run tag @s add Mns.State.IsCanCarving
    execute if score @s aj.lance_death.frame matches 132 run scoreboard players set @s Mns.General.Carving.Count 4

# 終了
    # execute if score @s aj.lance_death.frame matches 69 run function mhdp_monster_valk:core/tick/animation/event/lance_death/end
