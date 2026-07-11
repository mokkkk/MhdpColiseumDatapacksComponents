#> mhdp_monster_dino:core/tick/animation/event/breath/shot
#
# アニメーションイベントハンドラ ブレス
#
# @within function mhdp_monster_dino:core/tick/animation/event/tail_flame_l/attack

# 弾発射
    execute facing entity @n[type=area_effect_cloud,tag=Mns.ShotPos.Dino.2] feet run function api:object/summon.m {ObjectId:10032}

# 演出
    particle lava ~ ~ ~ 0.1 0.1 0.1 0 3
    particle flame ~ ~ ~ 0.1 0.1 0.1 0.2 20
    playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
