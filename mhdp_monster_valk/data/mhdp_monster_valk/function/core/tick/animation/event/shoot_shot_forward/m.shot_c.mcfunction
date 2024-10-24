#> mhdp_monster_valk:core/tick/animation/event/shoot_shot_horizon/main
#
# アニメーションイベントハンドラ 射撃
#
# @within function mhdp_monster_valk:core/tick/animation/event/tail_flame_l/attack

# 攻撃用Entity召喚
    $summon item_display ^$(posx) ^$(posy) ^$(posz) {teleport_duration:3,Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Shot","Start"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]},item:{id:"minecraft:white_dye",count:1,components:{"minecraft:custom_model_data":157}}}

# 初期化
    execute as @n[type=item_display,tag=Mns.Shot.Valk.Shot,tag=Start] at @s facing entity @n[type=area_effect_cloud,tag=Mns.ShotPos.Valk3] feet run tp @s ~ ~ ~ ~ ~

# 演出
    $particle flash ^$(posx) ^$(posy) ^$(posz) 0 0 0 0 1 force
    playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    playsound entity.shulker.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    playsound entity.shulker.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9

# 終了
    tag @n[type=item_display,tag=Mns.Shot.Valk.Shot,tag=Start] remove Start
