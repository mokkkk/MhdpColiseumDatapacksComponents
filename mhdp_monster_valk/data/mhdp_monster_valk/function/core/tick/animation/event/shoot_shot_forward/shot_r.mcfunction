#> mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/shot_r
#
# アニメーションイベントハンドラ 射撃 (前方、at_locator から実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_shot_forward/main

# Object: Shot (10040)
    execute facing entity @n[type=area_effect_cloud,tag=Mns.ShotPos.Valk] feet run function api:object/summon.m {ObjectId:10040}

# 演出
    particle flash{color:[1.000,0.300,0.300,1.00]} ^ ^ ^ 0 0 0 0 1 force
    playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    playsound entity.shulker.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    playsound entity.shulker.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
