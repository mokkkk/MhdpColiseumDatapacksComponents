#> mhdp_monster_dino:core/tick/animation/event/tail_flame_r/attack
#
# アニメーションイベントハンドラ 火炎
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1003,AttackName:"TailFlame",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:-1.5,Player_Offset_Y:0.0,Player_Offset_Z:4.0,\
    #         Player_Scale_X:2.4,Player_Scale_Y:4.0,Player_Scale_Z:6.5,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
    #         Entity_Offset_X:-1.5,Entity_Offset_Y:0.0,Entity_Offset_Z:4.0,\
    #         Entity_Scale_X:2.4,Entity_Scale_Y:4.0,Entity_Scale_Z:6.5\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1003,AttackName:"TailFlame",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:-1.5,Player_Offset_Y:0.0,Player_Offset_Z:6.0,\
            Player_Scale_X:2.4,Player_Scale_Y:4.0,Player_Scale_Z:6.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
            Entity_Offset_X:-1.5,Entity_Offset_Y:0.0,Entity_Offset_Z:6.0,\
            Entity_Scale_X:2.4,Entity_Scale_Y:4.0,Entity_Scale_Z:6.5\
    }

# 演出
    execute positioned ^ ^1 ^1 run particle flame ^ ^0.1 ^1.5 0.2 0.1 0.2 0.5 5
    execute positioned ^ ^1 ^3 run particle flame ^ ^0.1 ^1.5 0.2 0.1 0.2 0.5 5
    execute positioned ^ ^1 ^5 run particle flame ^ ^0.1 ^1.5 0.2 0.1 0.2 0.5 5
    execute positioned ^ ^1 ^7 run particle flame ^ ^0.1 ^1.5 0.2 0.1 0.2 0.5 5
    execute positioned ^ ^1 ^1 run particle lava ~ ~0 ~ 0.5 0.5 0.5 0.2 10
    execute positioned ^ ^1 ^3 run particle lava ~ ~0 ~ 0.5 0.5 0.5 0.2 10
    execute positioned ^ ^1 ^5 run particle lava ~ ~0 ~ 0.5 0.5 0.5 0.2 10
    execute positioned ^ ^1 ^7 run particle lava ~ ~0 ~ 0.5 0.5 0.5 0.2 10
    playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# 弾発射
    execute positioned ^-3 ^0.3 ^5 facing entity @n[type=area_effect_cloud,tag=Mns.ShotPos.Dino] feet run function api:object/summon.m {ObjectId:10031}
