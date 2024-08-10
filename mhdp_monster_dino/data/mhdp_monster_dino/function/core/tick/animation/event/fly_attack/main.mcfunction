#> mhdp_monster_reus:core/tick/animation/event/fly_attack/main
#
# アニメーションイベントハンドラ ひっかき
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.fly_attack.frame matches 1 run function mhdp_monster_reus:core/tick/animation/event/fly_attack/turn_start
    execute if score @s aj.fly_attack.frame matches 6 run function mhdp_monster_reus:core/tick/animation/event/fly_attack/turn_start
    execute if score @s aj.fly_attack.frame matches 1..10 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.fly_attack.frame matches 15..24 unless entity @n[tag=Mns.Target.Reus,distance=..5] at @s run tp @s ^ ^ ^0.4
    execute if score @s aj.fly_attack.frame matches 15..24 at @s run tp @s ^ ^ ^0.4
    execute if score @s aj.fly_attack.frame matches 25..31 at @s run tp @s ^ ^ ^0.1

# 効果音
    execute if score @s aj.fly_attack.frame matches 2 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_attack.frame matches 19 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 攻撃
    execute if score @s aj.fly_attack.frame matches 18..24 run function mhdp_monster_reus:core/tick/animation/event/fly_attack/attack

# 接地
    execute at @s if block ~ ~-1.8 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.1 ~ ~ ~
    execute at @s unless block ~ ~-1.7 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.fly_attack.frame matches 42 run function mhdp_monster_reus:core/tick/animation/event/fly_attack/end
