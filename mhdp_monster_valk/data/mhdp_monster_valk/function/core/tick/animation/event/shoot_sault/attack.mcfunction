#> mhdp_monster_valk:core/tick/animation/event/shoot_sault/attack
#
# アニメーションイベントハンドラ 前方爆発 (着弾当たり判定・main から実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_sault/main

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Bomb.Forward",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:3.5,\
    #         Player_Scale_X:18.2,Player_Scale_Y:6.2,Player_Scale_Z:4.6,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:3.5,\
    #         Entity_Scale_X:18.2,Entity_Scale_Y:6.2,Entity_Scale_Z:4.6\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Bomb.Forward",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:3.5,\
            Player_Scale_X:18.2,Player_Scale_Y:6.2,Player_Scale_Z:4.6,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:3.5,\
            Entity_Scale_X:18.2,Entity_Scale_Y:6.2,Entity_Scale_Z:4.6\
    }

# 演出
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    playsound entity.shulker.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    playsound entity.shulker.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    particle explosion ^-10 ^1 ^3 1.8 1.8 1.8 0 8
    particle explosion ^-5 ^1 ^3 1.8 1.8 1.8 0 8
    particle explosion ^ ^1 ^3 1.8 1.8 1.8 0 8
    particle explosion ^5 ^1 ^3 1.8 1.8 1.8 0 8
    particle explosion ^10 ^1 ^3 1.8 1.8 1.8 0 8
    particle large_smoke ^-10 ^1 ^3 1.8 1.8 1.8 0.1 8
    particle large_smoke ^-5 ^1 ^3 1.8 1.8 1.8 0.1 8
    particle large_smoke ^ ^1 ^3 1.8 1.8 1.8 0.1 8
    particle large_smoke ^5 ^1 ^3 1.8 1.8 1.8 0.1 8
    particle large_smoke ^10 ^1 ^3 1.8 1.8 1.8 0.1 8

    # Object: Bomb (10046) / RedFlash (10047)
        data modify storage api: Arg.Override set value {Scale:7}
        execute positioned ^-10 ^1 ^3 run function api:object/summon.m {ObjectId:10046}
        data modify storage api: Arg.Override set value {Scale:8}
        execute positioned ^-10 ^1 ^3 run function api:object/summon.m {ObjectId:10047}
        data modify storage api: Arg.Override set value {Scale:7.5}
        execute positioned ^-5 ^1 ^3 run function api:object/summon.m {ObjectId:10046}
        data modify storage api: Arg.Override set value {Scale:8}
        execute positioned ^-5 ^1 ^3 run function api:object/summon.m {ObjectId:10047}
        data modify storage api: Arg.Override set value {Scale:7}
        execute positioned ^ ^1 ^3 run function api:object/summon.m {ObjectId:10046}
        data modify storage api: Arg.Override set value {Scale:8}
        execute positioned ^ ^1 ^3 run function api:object/summon.m {ObjectId:10047}
        data modify storage api: Arg.Override set value {Scale:7.2}
        execute positioned ^5 ^1 ^3 run function api:object/summon.m {ObjectId:10046}
        data modify storage api: Arg.Override set value {Scale:8}
        execute positioned ^5 ^1 ^3 run function api:object/summon.m {ObjectId:10047}
        data modify storage api: Arg.Override set value {Scale:7.5}
        execute positioned ^10 ^1 ^3 run function api:object/summon.m {ObjectId:10046}
        data modify storage api: Arg.Override set value {Scale:8}
        execute positioned ^10 ^1 ^3 run function api:object/summon.m {ObjectId:10047}
