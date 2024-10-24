#> mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/main
#
# アニメーションイベントハンドラ 射撃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.shoot_shot_forward.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/turn_start
    execute if score @s aj.shoot_shot_forward.frame matches 2..10 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 効果音
    execute if score @s aj.shoot_shot_forward.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_shot_forward.frame matches 41 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_shot_forward.frame matches 7 run playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.shoot_shot_forward.frame matches 51..53 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_shot_forward.frame matches 51..53 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.shoot_shot_forward.frame matches 51..53 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.shoot_shot_forward.frame matches 51 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.shoot_shot_forward.frame matches 51 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4

# 演出
    execute if score @s aj.shoot_shot_forward.frame matches 2..33 run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/particle

# 攻撃
    execute if score @s aj.shoot_shot_forward.frame matches 10 if entity @n[tag=Mns.Target.Valk,distance=..10] positioned ^ ^ ^8 run summon area_effect_cloud ~ ~0.5 ~ {Duration:35,DurationOnUse:0,Tags:["Mns.ShotPos.Valk"]}
    execute if score @s aj.shoot_shot_forward.frame matches 10 unless entity @n[tag=Mns.Target.Valk,distance=..10] positioned as @n[tag=Mns.Target.Valk] positioned ^ ^ ^-10 run summon area_effect_cloud ~ ~0.5 ~ {Duration:35,DurationOnUse:0,Tags:["Mns.ShotPos.Valk"]}
    execute if score @s aj.shoot_shot_forward.frame matches 10 at @n[type=area_effect_cloud,tag=Mns.ShotPos.Valk] run summon area_effect_cloud ~ ~ ~ {Duration:35,DurationOnUse:0,Tags:["Mns.ShotPos.Valk2"]}
    execute if score @s aj.shoot_shot_forward.frame matches 10 at @n[type=area_effect_cloud,tag=Mns.ShotPos.Valk] run summon area_effect_cloud ~ ~ ~ {Duration:35,DurationOnUse:0,Tags:["Mns.ShotPos.Valk3"]}
    execute if score @s aj.shoot_shot_forward.frame matches 20..35 as @n[type=area_effect_cloud,tag=Mns.ShotPos.Valk] positioned as @s run tp @s ^0.1 ^ ^1
    execute if score @s aj.shoot_shot_forward.frame matches 20..35 as @n[type=area_effect_cloud,tag=Mns.ShotPos.Valk2] positioned as @s run tp @s ^-0.1 ^ ^1
    execute if score @s aj.shoot_shot_forward.frame matches 20..35 as @n[type=area_effect_cloud,tag=Mns.ShotPos.Valk3] positioned as @s run tp @s ^ ^ ^1.5
    execute if score @s aj.shoot_shot_forward.frame matches 20 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot_r with entity @s data.locators.pos_muzzle_r_0
    execute if score @s aj.shoot_shot_forward.frame matches 21 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot_l with entity @s data.locators.pos_muzzle_l_0
    execute if score @s aj.shoot_shot_forward.frame matches 23 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot_c with entity @s data.locators.pos_muzzle_r_2
    execute if score @s aj.shoot_shot_forward.frame matches 24 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot_l with entity @s data.locators.pos_muzzle_l_1
    execute if score @s aj.shoot_shot_forward.frame matches 26 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot_r with entity @s data.locators.pos_muzzle_r_1
    execute if score @s aj.shoot_shot_forward.frame matches 27 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot_l with entity @s data.locators.pos_muzzle_l_2
    execute if score @s aj.shoot_shot_forward.frame matches 29 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot_c with entity @s data.locators.pos_muzzle_r_2
    execute if score @s aj.shoot_shot_forward.frame matches 30 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot_l with entity @s data.locators.pos_muzzle_l_1
    execute if score @s aj.shoot_shot_forward.frame matches 32 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot_r with entity @s data.locators.pos_muzzle_r_0
    execute if score @s aj.shoot_shot_forward.frame matches 33 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot_l with entity @s data.locators.pos_muzzle_l_0

# モデル演出
    execute if score @s aj.shoot_shot_forward.frame matches 2 run function mhdp_monster_valk:core/util/models/ignite_start
    execute if score @s aj.shoot_shot_forward.frame matches 40 run function mhdp_monster_valk:core/util/models/ignite_end

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.shoot_shot_forward.frame matches 86 run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/end
