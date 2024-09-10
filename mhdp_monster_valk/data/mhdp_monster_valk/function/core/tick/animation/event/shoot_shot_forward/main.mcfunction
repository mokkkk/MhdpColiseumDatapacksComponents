#> mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/main
#
# アニメーションイベントハンドラ 射撃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.shoot_shot_forward.frame matches 2 run function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_r/turn_start
    execute if score @s aj.shoot_shot_forward.frame matches 2..6 run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 効果音
    execute if score @s aj.shoot_shot_forward.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.shoot_shot_forward.frame matches 36 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

    execute if score @s aj.shoot_shot_forward.frame matches 46..48 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.shoot_shot_forward.frame matches 46..48 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.shoot_shot_forward.frame matches 46..48 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.5 0.4
    execute if score @s aj.shoot_shot_forward.frame matches 46 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.shoot_shot_forward.frame matches 46 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4

# 攻撃
    execute if score @s aj.shoot_shot_forward.frame matches 6 if entity @n[tag=Mns.Target.Valk,distance=..14] positioned ^ ^ ^4 run summon area_effect_cloud ~ ~0.5 ~ {Duration:23,DurationOnUse:0,Tags:["Mns.ShotPos.Valk"]}
    execute if score @s aj.shoot_shot_forward.frame matches 6 unless entity @n[tag=Mns.Target.Valk,distance=..14] positioned as @n[tag=Mns.Target.Valk] positioned ^ ^ ^-14 run summon area_effect_cloud ~ ~0.5 ~ {Duration:23,DurationOnUse:0,Tags:["Mns.ShotPos.Valk"]}
    execute if score @s aj.shoot_shot_forward.frame matches 15..28 as @n[type=area_effect_cloud,tag=Mns.ShotPos.Valk] positioned as @s run tp @s ^ ^ ^1.5
    execute if score @s aj.shoot_shot_forward.frame matches 15 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot with entity @s data.locators.pos_muzzle_r_0
    execute if score @s aj.shoot_shot_forward.frame matches 16 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot with entity @s data.locators.pos_muzzle_l_0
    execute if score @s aj.shoot_shot_forward.frame matches 18 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot with entity @s data.locators.pos_muzzle_r_2
    execute if score @s aj.shoot_shot_forward.frame matches 19 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot with entity @s data.locators.pos_muzzle_l_1
    execute if score @s aj.shoot_shot_forward.frame matches 21 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot with entity @s data.locators.pos_muzzle_r_1
    execute if score @s aj.shoot_shot_forward.frame matches 22 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot with entity @s data.locators.pos_muzzle_l_2
    execute if score @s aj.shoot_shot_forward.frame matches 24 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot with entity @s data.locators.pos_muzzle_r_2
    execute if score @s aj.shoot_shot_forward.frame matches 25 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot with entity @s data.locators.pos_muzzle_l_1
    execute if score @s aj.shoot_shot_forward.frame matches 27 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot with entity @s data.locators.pos_muzzle_r_0
    execute if score @s aj.shoot_shot_forward.frame matches 28 on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/m.shot with entity @s data.locators.pos_muzzle_l_0

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.shoot_shot_forward.frame matches 81 run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/end
