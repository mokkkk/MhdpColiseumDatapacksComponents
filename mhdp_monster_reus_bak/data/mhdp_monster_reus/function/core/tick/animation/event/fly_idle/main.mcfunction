#> mhdp_monster_reus:core/tick/animation/event/fly_idle/main
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.fly_idle.frame matches 10 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_idle.frame matches 30 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    execute at @s if block ~ ~-2.6 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.1 ~ ~ ~
    execute at @s unless block ~ ~-2.5 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.fly_idle.frame matches 39 run function mhdp_monster_reus:core/tick/animation/event/fly_idle/end
