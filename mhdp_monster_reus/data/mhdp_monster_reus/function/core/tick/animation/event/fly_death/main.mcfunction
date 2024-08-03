#> mhdp_monster_reus:core/tick/animation/event/fly_death/main
#
# アニメーションイベントハンドラ 飛行中討伐
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.death_flying.frame matches 7 at @s run function mhdp_monster_reus:core/tick/animation/event/fly_death/move_start
    execute if score @s aj.death_flying.frame matches 7..16 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 演出
    execute if score @s aj.death_flying.frame matches 16 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.death_flying.frame matches 16 run particle block{block_state:"minecraft:sand"} ~ ~0.5 ~ 2 0.5 2 0 30
    execute if score @s aj.death_flying.frame matches 33..37 run playsound entity.ravager.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 0.6 0.5
    execute if score @s aj.death_flying.frame matches 33..37 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 0.6 1
    execute if score @s aj.death_flying.frame matches 69 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    execute if score @s aj.death_flying.frame matches 16.. at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.death_flying.frame matches 16.. at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態変更
    execute if score @s aj.death_flying.frame matches 16 run tag @s remove Mns.State.IsFlying
    execute if score @s aj.death_flying.frame matches 16 run tag @s remove Mns.Reus.State.Flying

# まばたき
    execute if score @s aj.death_flying.frame matches 69 run scoreboard players set @s Mns.General.BlinkTimer 10000000

# 終了
    execute if score @s aj.death_flying.frame matches 69 run function mhdp_monster_reus:core/tick/animation/event/fly_death/end
