#> mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/attack
#
# アニメーションイベントハンドラ 翼叩きつけ (着弾当たり判定・main から positioned で実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_vertical_r/main

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"VerticalS.Right",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:1.2,Player_Offset_Y:0.5,Player_Offset_Z:0.2,\
    #         Player_Scale_X:4.7,Player_Scale_Y:6.0,Player_Scale_Z:2.6,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:1.2,Entity_Offset_Y:0.5,Entity_Offset_Z:0.2,\
    #         Entity_Scale_X:4.7,Entity_Scale_Y:6.0,Entity_Scale_Z:2.6,\
    # }
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"VerticalS.Right",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:1.2,Player_Offset_Y:0.5,Player_Offset_Z:4.8,\
    #         Player_Scale_X:6.2,Player_Scale_Y:6.0,Player_Scale_Z:3.2,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:1.2,Entity_Offset_Y:0.5,Entity_Offset_Z:4.8,\
    #         Entity_Scale_X:6.2,Entity_Scale_Y:6.0,Entity_Scale_Z:3.2\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"VerticalS.Right",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:1.2,Player_Offset_Y:0.5,Player_Offset_Z:0.2,\
            Player_Scale_X:4.7,Player_Scale_Y:6.0,Player_Scale_Z:2.6,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:1.2,Entity_Offset_Y:0.5,Entity_Offset_Z:0.2,\
            Entity_Scale_X:4.7,Entity_Scale_Y:6.0,Entity_Scale_Z:2.6,\
    }
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"VerticalS.Right",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:1.2,Player_Offset_Y:0.5,Player_Offset_Z:4.8,\
            Player_Scale_X:6.2,Player_Scale_Y:6.0,Player_Scale_Z:3.2,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:1.2,Entity_Offset_Y:0.5,Entity_Offset_Z:4.8,\
            Entity_Scale_X:6.2,Entity_Scale_Y:6.0,Entity_Scale_Z:3.2\
    }

# 演出
    particle explosion ~ ~ ~ 1 0.1 1 0 10
    execute positioned ^ ^ ^3 run particle explosion ~ ~ ~ 2 0.1 2 0 10
    execute positioned ^ ^ ^6 run particle explosion ~ ~ ~ 3 0.1 3 0 10
    execute at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound entity.wither.break_block master @s ^ ^1 ^1 0.4 0.8 0.4
    playsound item.mace.smash_ground master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound item.mace.smash_ground master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^1.5 0.2 0.1 0.2 0.2 25 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^1.5 0.2 0.1 0.2 0.5 15 normal
    execute positioned ^ ^ ^0 rotated ~ 0 run function api:object/summon.m {ObjectId:16}
    execute positioned ^ ^ ^2 rotated ~ 0 run function api:object/summon.m {ObjectId:16}
    execute positioned ^ ^ ^4 rotated ~ 0 run function api:object/summon.m {ObjectId:16}
    execute positioned ^2 ^ ^2 rotated ~ 0 run function api:object/summon.m {ObjectId:16}
    execute positioned ^3 ^ ^4 rotated ~ 0 run function api:object/summon.m {ObjectId:16}
    execute positioned ^-2 ^ ^2 rotated ~ 0 run function api:object/summon.m {ObjectId:16}
    execute positioned ^-3 ^ ^4 rotated ~ 0 run function api:object/summon.m {ObjectId:16}
