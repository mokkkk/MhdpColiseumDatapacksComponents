#> mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/main
#
# アニメーションイベントハンドラ 射撃 (前方)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.shoot_shot_forward.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Valk",Tick:10,MaxRotation:180}
    execute if score @s aj.shoot_shot_forward.frame matches 2..10 at @s run function mhdp_monsters:core/util/tick/event/alignment

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
    execute if score @s aj.shoot_shot_forward.frame matches 10 if entity @n[tag=Mns.Target.Valk,distance=..10] positioned ^ ^ ^8 run summon area_effect_cloud ~ ~0.5 ~ {Duration:35,DurationOnUse:0,Tags:["Mns.ShotPos.Valk"],custom_particle:{type:"block",block_state:"minecraft:air"}}
    execute if score @s aj.shoot_shot_forward.frame matches 10 unless entity @n[tag=Mns.Target.Valk,distance=..10] positioned as @n[tag=Mns.Target.Valk] positioned ^ ^ ^-10 run summon area_effect_cloud ~ ~0.5 ~ {Duration:35,DurationOnUse:0,Tags:["Mns.ShotPos.Valk"],custom_particle:{type:"block",block_state:"minecraft:air"}}
    execute if score @s aj.shoot_shot_forward.frame matches 10 at @n[type=area_effect_cloud,tag=Mns.ShotPos.Valk] run summon area_effect_cloud ~ ~ ~ {Duration:35,DurationOnUse:0,Tags:["Mns.ShotPos.Valk2"],custom_particle:{type:"block",block_state:"minecraft:air"}}
    execute if score @s aj.shoot_shot_forward.frame matches 10 at @n[type=area_effect_cloud,tag=Mns.ShotPos.Valk] run summon area_effect_cloud ~ ~ ~ {Duration:35,DurationOnUse:0,Tags:["Mns.ShotPos.Valk3"],custom_particle:{type:"block",block_state:"minecraft:air"}}
    execute if score @s aj.shoot_shot_forward.frame matches 20..35 as @n[type=area_effect_cloud,tag=Mns.ShotPos.Valk] positioned as @s run tp @s ^0.1 ^ ^1
    execute if score @s aj.shoot_shot_forward.frame matches 20..35 as @n[type=area_effect_cloud,tag=Mns.ShotPos.Valk2] positioned as @s run tp @s ^-0.1 ^ ^1
    execute if score @s aj.shoot_shot_forward.frame matches 20..35 as @n[type=area_effect_cloud,tag=Mns.ShotPos.Valk3] positioned as @s run tp @s ^ ^ ^1.5
    execute if score @s aj.shoot_shot_forward.frame matches 20 run function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_0",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/shot_r"}
    execute if score @s aj.shoot_shot_forward.frame matches 21 run function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_0",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/shot_l"}
    execute if score @s aj.shoot_shot_forward.frame matches 23 run function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_2",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/shot_c"}
    execute if score @s aj.shoot_shot_forward.frame matches 24 run function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_1",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/shot_l"}
    execute if score @s aj.shoot_shot_forward.frame matches 26 run function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_1",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/shot_r"}
    execute if score @s aj.shoot_shot_forward.frame matches 27 run function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_2",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/shot_l"}
    execute if score @s aj.shoot_shot_forward.frame matches 29 run function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_2",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/shot_c"}
    execute if score @s aj.shoot_shot_forward.frame matches 30 run function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_1",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/shot_l"}
    execute if score @s aj.shoot_shot_forward.frame matches 32 run function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_0",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/shot_r"}
    execute if score @s aj.shoot_shot_forward.frame matches 33 run function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_0",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/shot_l"}

# モデル演出
    execute if score @s aj.shoot_shot_forward.frame matches 2 run function mhdp_monster_valk:core/util/models/ignite_start
    execute if score @s aj.shoot_shot_forward.frame matches 40 run function mhdp_monster_valk:core/util/models/ignite_end

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.shoot_shot_forward.frame matches 86 run function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/end
