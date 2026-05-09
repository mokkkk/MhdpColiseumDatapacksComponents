#> mhdp_monster_ranposu:core/tick/animation/event/death/main
#
# アニメーションイベントハンドラ 討伐
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 移動
    execute if score @s aj.death.frame matches 76..88 run tp @s ^0.1 ^ ^

# 効果音
    execute if score @s aj.death.frame matches 40 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s aj.death.frame matches 76 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.death.frame matches 89 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.death.frame matches 89 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7

# 接地
    execute if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# まばたき
    execute if score @s aj.death.frame matches 76 run scoreboard players set @s Mns.General.BlinkTimer 10000000

# 剝ぎ取り可能
    execute if score @s aj.death.frame matches 76 run tag @s add Mns.State.IsCanCarving
    execute if score @s aj.death.frame matches 76 run scoreboard players set @s Mns.General.Carving.Count 3

# 終了
    execute if score @s aj.death.frame matches 139 run function mhdp_monster_ranposu:core/tick/animation/event/death/end
