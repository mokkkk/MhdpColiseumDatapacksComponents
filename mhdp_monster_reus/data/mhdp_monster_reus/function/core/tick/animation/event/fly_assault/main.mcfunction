#> mhdp_monster_reus:core/tick/animation/event/fly_assault/main
#
# アニメーションイベントハンドラ 急襲
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.fly_move_right.frame matches 2..28 run tag @n[tag=Mns.Target.Reus] add Temp.Rotate.Target
    execute if score @s aj.fly_move_right.frame matches 2..28 at @s run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.fly_assault.frame matches 2..12 at @s run tp @s ^ ^0.3 ^-0.2
    execute if score @s aj.fly_assault.frame matches 28 at @s run function mhdp_monster_reus:core/tick/animation/event/fly_assault/move_start_0
    execute if score @s aj.fly_assault.frame matches 41 at @s run function mhdp_monster_reus:core/tick/animation/event/fly_assault/move_start_1
    execute if score @s aj.fly_assault.frame matches 32..49 at @s run function mhdp_monsters:core/util/other/move_to_target_move
    execute if score @s aj.fly_assault.frame matches 41..49 at @s run tp @s ~ ~ ~ ~20 ~
    execute if score @s aj.fly_assault.frame matches 50..58 at @s run tp @s ^ ^ ^-0.2

# 演出
    execute if score @s aj.fly_assault.frame matches 8 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_assault.frame matches 44 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_assault.frame matches 32..41 run particle cloud ^3.5 ^6.8 ^-0.8 0.1 0.1 0.1 0.05 3
    execute if score @s aj.fly_assault.frame matches 32..41 run particle cloud ^-3.5 ^6.8 ^-0.8 0.1 0.1 0.1 0.05 3
    execute if score @s aj.fly_assault.frame matches 2..6 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound entity.ravager.attack master @s ^ ^1 ^1 0.4 0.9 0.4

# 攻撃
    execute if score @s aj.fly_assault.frame matches 32..42 run function mhdp_monster_reus:core/tick/animation/event/fly_assault/attack

# 接地
    execute if score @s aj.fly_assault.frame matches 55.. at @s if block ~ ~-2.3 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.1 ~ ~ ~
    execute if score @s aj.fly_assault.frame matches 55.. at @s unless block ~ ~-2.2 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.fly_assault.frame matches 64 run function mhdp_monster_reus:core/tick/animation/event/fly_assault/end
