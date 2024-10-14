#> mhdp_monster_reus:core/tick/animation/event/fly_flame_vertical/main
#
# アニメーションイベントハンドラ 地走り火炎
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.fly_flame_vertical.frame matches 2..65 run tag @n[tag=Mns.Target.Reus] add Temp.Rotate.Target
    execute if score @s aj.fly_flame_vertical.frame matches 2..65 at @s run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.fly_flame_vertical.frame matches 2..18 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.fly_flame_vertical.frame matches 76..86 at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.fly_flame_vertical.frame matches 99 at @s run function mhdp_monster_reus:core/tick/animation/event/fly_flame_vertical/move_start
    execute if score @s aj.fly_flame_vertical.frame matches 99..105 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 演出
    execute if score @s aj.fly_flame_vertical.frame matches 2 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s aj.fly_flame_vertical.frame matches 4 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_flame_vertical.frame matches 16 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_flame_vertical.frame matches 2..34 on passengers if entity @s[tag=aj.data] run function mhdp_monster_reus:core/tick/animation/event/land_chargebite/head_effect with entity @s data.locators.pos_head
    execute if score @s aj.fly_flame_vertical.frame matches 40 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_flame_vertical.frame matches 53 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_flame_vertical.frame matches 65 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_flame_vertical.frame matches 80 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_flame_vertical.frame matches 93 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_flame_vertical.frame matches 105 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_flame_vertical.frame matches 105 run particle block{block_state:"minecraft:sand"} ~ ~0.5 ~ 2 0.5 2 0 30

# 攻撃位置決定
    execute if score @s aj.fly_flame_vertical.frame matches 32 run summon area_effect_cloud ^3.5 ^8 ^1 {Duration:50,DurationOnUse:0,Tags:["Mns.ShotPos.Reus"]}
    execute if score @s aj.fly_flame_vertical.frame matches 32 as @n[type=area_effect_cloud,tag=Mns.ShotPos.Reus] at @s if block ~ ~-0.3 ~ #mhdp_core:no_collision run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.fly_flame_vertical.frame matches 58 as @n[type=area_effect_cloud,tag=Mns.ShotPos.Reus] positioned as @s facing entity @n[tag=Mns.Target.Reus] feet rotated ~ 0 run tp @s ~ ~ ~ ~ ~

# 攻撃
    execute if score @s aj.fly_flame_vertical.frame matches 32..64 run function mhdp_monster_reus:core/tick/animation/event/fly_flame_vertical/attack_before
    execute if score @s aj.fly_flame_vertical.frame matches 65..73 run function mhdp_monster_reus:core/tick/animation/event/fly_flame_vertical/attack
    execute if score @s aj.fly_flame_vertical.frame matches 74..78 run function mhdp_monster_reus:core/tick/animation/event/fly_flame_vertical/attack_after

# 接地
    execute if score @s aj.fly_flame_vertical.frame matches 1..20 at @s if block ~ ~-5.9 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.1 ~ ~ ~
    execute if score @s aj.fly_flame_vertical.frame matches 1..20 at @s unless block ~ ~-5.8 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~
    execute if score @s aj.fly_flame_vertical.frame matches 21..40 at @s if block ~ ~-4.6 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.2 ~ ~ ~
    execute if score @s aj.fly_flame_vertical.frame matches 21..40 at @s unless block ~ ~-4.5 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~
    execute if score @s aj.fly_flame_vertical.frame matches 76..98 at @s if block ~ ~-1.6 ~ #mhdp_core:no_collision at @s run tp @s ~ ~-0.2 ~ ~ ~
    execute if score @s aj.fly_flame_vertical.frame matches 76..98 at @s unless block ~ ~-1.5 ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~
    execute if score @s aj.fly_flame_vertical.frame matches 106.. at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.fly_flame_vertical.frame matches 106.. at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態変更
    execute if score @s aj.fly_flame_vertical.frame matches 106 run tag @s remove Mns.State.IsFlying
    execute if entity @s[tag=Mns.Reus.State.Flying] if score @s aj.fly_flame_vertical.frame matches 106 run function mhdp_monster_reus:core/tick/animation/event/fly_flame_vertical/change_phase

# 終了
    execute if score @s aj.fly_flame_vertical.frame matches 129 run function mhdp_monster_reus:core/tick/animation/event/fly_flame_vertical/end
