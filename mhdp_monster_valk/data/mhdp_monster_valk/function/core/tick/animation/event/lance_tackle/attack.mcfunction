#> mhdp_monster_valk:core/tick/animation/event/lance_tackle/attack
#
# アニメーションイベントハンドラ 蛇行突進
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_tackle/main

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Tackle",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:4.0,\
    #         Player_Scale_X:3.4,Player_Scale_Y:3.4,Player_Scale_Z:3.4,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:4.0,\
    #         Entity_Scale_X:3.4,Entity_Scale_Y:3.4,Entity_Scale_Z:3.4\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Tackle",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:4.0,\
            Player_Scale_X:3.4,Player_Scale_Y:3.4,Player_Scale_Z:3.4,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:4.0,\
            Entity_Scale_X:3.4,Entity_Scale_Y:3.4,Entity_Scale_Z:3.4\
    }
