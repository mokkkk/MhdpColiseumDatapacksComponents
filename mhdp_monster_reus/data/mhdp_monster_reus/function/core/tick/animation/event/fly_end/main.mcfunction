#> mhdp_monster_reus:core/tick/animation/event/fly_end/main
#
# アニメーションイベントハンドラ 着地
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.fly_end.frame matches 2 at @s run function mhdp_monster_reus:core/tick/animation/event/fly_end/move_start
    execute if score @s aj.fly_end.frame matches 3..19 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 演出
    execute if score @s aj.fly_end.frame matches 6 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_end.frame matches 19 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_end.frame matches 19 run particle block{block_state:"minecraft:sand"} ~ ~0.5 ~ 2 0.5 2 0 30

# 接地
    execute if score @s aj.fly_end.frame matches 20.. at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.fly_end.frame matches 20.. at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.fly_end.frame matches 39 run function mhdp_monster_reus:core/tick/animation/event/fly_end/end
