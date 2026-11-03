#> mhdp_monster_reus:core/tick/animation/event/fly_movebreath_r/main
#
# アニメーションイベントハンドラ 飛行ブレス
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.fly_movebreath_r.frame matches 2..10 run tag @n[tag=Mns.Target.Reus] add Temp.Rotate.Target
    execute if score @s aj.fly_movebreath_r.frame matches 2..10 at @s run function mhdp_monsters:core/util/other/turn_to_target_accurate
    execute if score @s aj.fly_movebreath_r.frame matches 39..60 run tag @n[tag=Mns.Target.Reus] add Temp.Rotate.Target
    execute if score @s aj.fly_movebreath_r.frame matches 39..60 at @s run function mhdp_monsters:core/util/other/turn_to_target_accurate
    
# 移動
    execute if score @s aj.fly_movebreath_r.frame matches 1..10 at @s run tp @s ^ ^0.1 ^-0.2
    execute if score @s aj.fly_movebreath_r.frame matches 15 facing entity @e[tag=Mns.Target.Reus] feet rotated ~ 0 run function mhdp_monster_reus:core/tick/animation/event/fly_movebreath_r/move_start_0
    execute if score @s aj.fly_movebreath_r.frame matches 16..50 at @s run function mhdp_monsters:core/util/other/move_to_target_move
    execute if score @s aj.fly_movebreath_r.frame matches 16..21 at @s run tp @s ^-0.8 ^ ^0.1 ~ ~
    execute if score @s aj.fly_movebreath_r.frame matches 22..27 at @s run tp @s ^-0.4 ^ ^0.1 ~ ~
    execute if score @s aj.fly_movebreath_r.frame matches 39..50 at @s run tp @s ^0.1 ^ ^-0.1 ~ ~
    execute if score @s aj.fly_movebreath_r.frame matches 56..62 at @s run tp @s ^ ^0.1 ^-0.2 ~ ~
    execute if score @s aj.fly_movebreath_r.frame matches 63..69 at @s run tp @s ^ ^-0.1 ^-0.2 ~ ~

# 演出
    execute if score @s aj.fly_movebreath_r.frame matches 6 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_movebreath_r.frame matches 21 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_movebreath_r.frame matches 55 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 攻撃
    execute if score @s aj.fly_movebreath_r.frame matches 52 positioned as @n[tag=Mns.Target.Reus] run summon area_effect_cloud ~ ~0.5 ~ {Duration:10,DurationOnUse:0,Tags:["Mns.ShotPos.Reus"]}
    execute if score @s aj.fly_movebreath_r.frame matches 56 positioned ^ ^2.8 ^5.5 run function mhdp_monster_reus:core/tick/animation/event/land_breath/shot

# 接地
    execute if score @s aj.fly_movebreath_r.frame matches 70.. at @s if block ~ ~-2.3 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.1 ~ ~ ~
    execute if score @s aj.fly_movebreath_r.frame matches 70.. at @s unless block ~ ~-2.2 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.fly_movebreath_r.frame matches 79 run function mhdp_monster_reus:core/tick/animation/event/fly_movebreath_r/end
