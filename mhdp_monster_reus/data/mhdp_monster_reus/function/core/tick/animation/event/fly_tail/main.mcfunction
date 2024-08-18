#> mhdp_monster_reus:core/tick/animation/event/fly_tail/main
#
# アニメーションイベントハンドラ 飛行尻尾なぎはらい
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.fly_tail.frame matches 1 run function mhdp_monster_reus:core/tick/animation/event/fly_tail/turn_start
    execute if score @s aj.fly_tail.frame matches 2..8 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.fly_tail.frame matches 6..12 run tp @s ^ ^ ^0.1
    execute if score @s aj.fly_tail.frame matches 26..34 run tp @s ^ ^ ^0.25

# 効果音
    execute if score @s aj.fly_tail.frame matches 2 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_tail.frame matches 79 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_tail.frame matches 28 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_tail.frame matches 48..52 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound entity.ravager.attack master @s ^ ^1 ^1 0.4 0.7 0.4

# 攻撃
    execute if score @s aj.fly_tail.frame matches 26..34 run function mhdp_monster_reus:core/tick/animation/event/fly_tail/attack

# 接地
    execute at @s if block ~ ~-1.2 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.1 ~ ~ ~
    execute at @s unless block ~ ~-1.1 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.fly_tail.frame matches 88 run function mhdp_monster_reus:core/tick/animation/event/fly_tail/end
