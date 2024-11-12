#> mhdp_monster_reus:core/tick/animation/event/fly_damage_counter_start/main
#
# アニメーションイベントハンドラ 飛行中相殺怯み
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.fly_damage_counter_start.frame matches 14 at @s run function mhdp_monster_reus:core/tick/animation/event/fly_damage_counter_start/move_start
    execute if score @s aj.fly_damage_counter_start.frame matches 14..20 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 演出
    execute if score @s aj.fly_damage_counter_start.frame matches 2 run playsound entity.ravager.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.fly_damage_counter_start.frame matches 2 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s aj.fly_damage_counter_start.frame matches 20 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_damage_counter_start.frame matches 20 run particle block{block_state:"minecraft:sand"} ~ ~0.5 ~ 2 0.5 2 0 30
    execute if score @s aj.fly_damage_counter_start.frame matches 28..30 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_damage_counter_start.frame matches 28..32 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 5
    
# 接地
    execute if score @s aj.fly_damage_counter_start.frame matches 20.. at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.fly_damage_counter_start.frame matches 20.. at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態変更
    execute if score @s aj.fly_damage_counter_start.frame matches 20 run tag @s remove Mns.State.IsFlying
    execute if score @s aj.fly_damage_counter_start.frame matches 20 run function mhdp_monster_reus:core/tick/animation/event/fly_damage_counter_start/change_phase

# 終了
    execute if score @s aj.fly_damage_counter_start.frame matches 34 run function mhdp_monster_reus:core/tick/animation/event/fly_damage_counter_start/end
