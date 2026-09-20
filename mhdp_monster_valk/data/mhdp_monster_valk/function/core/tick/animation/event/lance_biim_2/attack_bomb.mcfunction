#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_bomb
#
# アニメーションイベントハンドラ 龍閃 ビーム着弾爆発
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/main

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Beam",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:0.0,\
    #         Player_Scale_X:6.5,Player_Scale_Y:6.5,Player_Scale_Z:6.5,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:0.0,\
    #         Entity_Scale_X:5.5,Entity_Scale_Y:5.5,Entity_Scale_Z:5.5\
    # }
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Beam",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:6.0,\
    #         Player_Scale_X:6.5,Player_Scale_Y:6.5,Player_Scale_Z:6.5,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:6.0,\
    #         Entity_Scale_X:5.5,Entity_Scale_Y:5.5,Entity_Scale_Z:5.5\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Beam",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:0.0,\
            Player_Scale_X:6.5,Player_Scale_Y:6.5,Player_Scale_Z:6.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:0.0,\
            Entity_Scale_X:5.5,Entity_Scale_Y:5.5,Entity_Scale_Z:5.5\
    }
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Beam",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:6.0,\
            Player_Scale_X:6.5,Player_Scale_Y:6.5,Player_Scale_Z:6.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:6.0,\
            Entity_Scale_X:5.5,Entity_Scale_Y:5.5,Entity_Scale_Z:5.5\
    }

# 演出
    particle dust{color:[1.000,0.000,0.152],scale:3} ^ ^1 ^ 0.8 0.8 0.8 0.15 13
    particle dust{color:[1.000,0.000,0.152],scale:3} ^ ^1 ^6 0.8 0.8 0.8 0.15 13
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    particle explosion ^ ^1 ^ 1.8 1.8 1.8 0 6
    particle explosion ^ ^1 ^6 1.8 1.8 1.8 0 6

    # Object: Bomb (10046) / RedFlash (10047)
        execute positioned ^ ^1 ^ run function api:object/summon.m {ObjectId:10046}
        data modify storage api: Arg.Override set value {Scale:8}
        execute positioned ^ ^1 ^ run function api:object/summon.m {ObjectId:10047}
        execute positioned ^ ^1 ^6 run function api:object/summon.m {ObjectId:10046}
        data modify storage api: Arg.Override set value {Scale:8}
        execute positioned ^ ^1 ^6 run function api:object/summon.m {ObjectId:10047}
