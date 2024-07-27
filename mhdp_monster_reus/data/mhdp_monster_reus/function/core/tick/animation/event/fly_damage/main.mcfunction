#> mhdp_monster_reus:core/tick/animation/event/fly_damage/main
#
# アニメーションイベントハンドラ 飛行中怯み
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 演出
    execute if score @s aj.fly_damage.frame matches 2 run playsound entity.ravager.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.fly_damage.frame matches 2 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s aj.fly_damage.frame matches 19 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_damage.frame matches 39 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_damage.frame matches 59 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    execute at @s if block ~ ~-2.2 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.1 ~ ~ ~
    execute at @s unless block ~ ~-2.1 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.fly_damage.frame matches 69 run function mhdp_monster_reus:core/tick/animation/event/fly_damage/end
