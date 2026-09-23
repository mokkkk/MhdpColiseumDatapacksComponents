#> mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/attack
#
# アニメーションイベントハンドラ 前方爆発 (着弾当たり判定・main から実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/main

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Bomb.Forward",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:6.0,Player_Offset_Y:1.0,Player_Offset_Z:9.0,\
    #         Player_Scale_X:2.5,Player_Scale_Y:2.5,Player_Scale_Z:2.5,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:6.0,Entity_Offset_Y:1.0,Entity_Offset_Z:9.0,\
    #         Entity_Scale_X:2.5,Entity_Scale_Y:2.5,Entity_Scale_Z:2.5\
    # }
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Bomb.Forward",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:9.0,\
    #         Player_Scale_X:4.5,Player_Scale_Y:4.5,Player_Scale_Z:4.5,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:9.0,\
    #         Entity_Scale_X:4.5,Entity_Scale_Y:4.5,Entity_Scale_Z:4.5\
    # }
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Bomb.Forward",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:-6.0,Player_Offset_Y:1.0,Player_Offset_Z:9.0,\
    #         Player_Scale_X:2.5,Player_Scale_Y:2.5,Player_Scale_Z:2.5,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:-6.0,Entity_Offset_Y:1.0,Entity_Offset_Z:9.0,\
    #         Entity_Scale_X:2.5,Entity_Scale_Y:2.5,Entity_Scale_Z:2.5\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Bomb.Forward",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:6.0,Player_Offset_Y:1.0,Player_Offset_Z:9.0,\
            Player_Scale_X:2.5,Player_Scale_Y:2.5,Player_Scale_Z:2.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:6.0,Entity_Offset_Y:1.0,Entity_Offset_Z:9.0,\
            Entity_Scale_X:2.5,Entity_Scale_Y:2.5,Entity_Scale_Z:2.5\
    }
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Bomb.Forward",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:9.0,\
            Player_Scale_X:4.5,Player_Scale_Y:4.5,Player_Scale_Z:4.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:9.0,\
            Entity_Scale_X:4.5,Entity_Scale_Y:4.5,Entity_Scale_Z:4.5\
    }
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Bomb.Forward",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:-6.0,Player_Offset_Y:1.0,Player_Offset_Z:9.0,\
            Player_Scale_X:2.5,Player_Scale_Y:2.5,Player_Scale_Z:2.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:-6.0,Entity_Offset_Y:1.0,Entity_Offset_Z:9.0,\
            Entity_Scale_X:2.5,Entity_Scale_Y:2.5,Entity_Scale_Z:2.5\
    }

# 演出
    particle dust{color:[1.000,0.000,0.152],scale:3} ^5 ^2 ^3 0.8 0.8 0.8 0.15 13
    particle dust{color:[1.000,0.000,0.152],scale:3} ^ ^2 ^3 0.8 0.8 0.8 0.15 13
    particle dust{color:[1.000,0.000,0.152],scale:3} ^-5 ^2 ^3 0.8 0.8 0.8 0.15 13
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    particle explosion ^5 ^2 ^8 1.2 1.2 1.2 0 8
    particle explosion ^ ^2 ^8 1.2 1.2 1.2 0 8
    particle explosion ^-5 ^2 ^8 1.2 1.2 1.2 0 8
    playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    playsound entity.shulker.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    playsound entity.shulker.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9

    # Object: Bomb (10046) / RedFlash (10047)
        execute positioned ^5 ^1 ^8 run function api:object/summon.m {ObjectId:10046}
        data modify storage api: Arg.Override set value {Scale:7}
        execute positioned ^5 ^1 ^8 run function api:object/summon.m {ObjectId:10047}
        execute positioned ^ ^1 ^9.2 run function api:object/summon.m {ObjectId:10046}
        data modify storage api: Arg.Override set value {Scale:7}
        execute positioned ^ ^1 ^9.2 run function api:object/summon.m {ObjectId:10047}
        execute positioned ^-5 ^1 ^8 run function api:object/summon.m {ObjectId:10046}
        data modify storage api: Arg.Override set value {Scale:7}
        execute positioned ^-5 ^1 ^8 run function api:object/summon.m {ObjectId:10047}
        data modify storage api: Arg.Override set value {Scale:8}
        execute positioned ^ ^1 ^6 run function api:object/summon.m {ObjectId:10047}
