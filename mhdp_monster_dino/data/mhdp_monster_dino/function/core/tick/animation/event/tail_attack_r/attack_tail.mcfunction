#> mhdp_monster_dino:core/tick/animation/event/tail_attack_r/attack_tail
#
# アニメーションイベントハンドラ 尻尾叩きつけ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1003,AttackName:"Tail",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:1.5,Player_Offset_Y:1.0,Player_Offset_Z:2.0,\
    #         Player_Scale_X:2.0,Player_Scale_Y:3.0,Player_Scale_Z:3.5,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
    #         Entity_Offset_X:1.5,Entity_Offset_Y:1.0,Entity_Offset_Z:2.0,\
    #         Entity_Scale_X:2.0,Entity_Scale_Y:3.0,Entity_Scale_Z:3.5\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1003,AttackName:"Tail",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:1.5,Player_Offset_Y:1.0,Player_Offset_Z:2.0,\
            Player_Scale_X:2.0,Player_Scale_Y:3.0,Player_Scale_Z:3.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
            Entity_Offset_X:1.5,Entity_Offset_Y:1.0,Entity_Offset_Z:2.0,\
            Entity_Scale_X:2.0,Entity_Scale_Y:3.0,Entity_Scale_Z:3.5\
    }
