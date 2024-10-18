#> mhdp_monster_dino:core/tick/animation/event/death/main
#
# アニメーションイベントハンドラ 討伐
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 移動
    execute if score @s aj.death.frame matches 98..102 at @s run tp @s ^0.1 ^ ^
    execute if score @s aj.death.frame matches 103..111 at @s run tp @s ^0.3 ^ ^

# 効果音
    execute if score @s aj.death.frame matches 35 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.death.frame matches 97 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.death.frame matches 13 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.death.frame matches 111 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.death.frame matches 13 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30
    execute if score @s aj.death.frame matches 111 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30
    execute if score @s aj.death.frame matches 72..81 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.hurt master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.death.frame matches 72..81 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.hurt master @s ^ ^1 ^1 0.4 0.5 0.4

# まばたき
    execute if score @s aj.death.frame matches 111 run scoreboard players set @s Mns.General.BlinkTimer 10000000
    
# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 剝ぎ取り可能
    execute if score @s aj.death.frame matches 111 run tag @s add Mns.State.IsCanCarving
    execute if score @s aj.death.frame matches 111 run scoreboard players set @s Mns.General.Carving.Count 3

# 終了
    execute if score @s aj.death.frame matches 124 run function mhdp_monster_dino:core/tick/animation/event/death/end
