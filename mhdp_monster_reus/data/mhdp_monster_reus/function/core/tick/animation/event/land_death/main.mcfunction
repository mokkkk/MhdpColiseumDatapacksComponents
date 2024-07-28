#> mhdp_monster_reus:core/tick/animation/event/land_death/main
#
# アニメーションイベントハンドラ 討伐
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.land_death.frame matches 86..96 at @s run tp @s ^0.2 ^ ^0.2
# 効果音
    execute if score @s aj.land_death.frame matches 10 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 5
    execute if score @s aj.land_death.frame matches 10 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.land_death.frame matches 44..48 run playsound entity.ravager.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 0.8 0.5
    execute if score @s aj.land_death.frame matches 44..48 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 0.8 1
    execute if score @s aj.land_death.frame matches 96 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 5
    execute if score @s aj.land_death.frame matches 96 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# まばたき
    execute if score @s aj.land_death.frame matches 86 run scoreboard players set @s Mns.General.BlinkTimer 10000000

# 終了
    execute if score @s aj.land_death.frame matches 29 run function mhdp_monster_reus:core/tick/animation/event/land_death/end
