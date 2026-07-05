#> mhdp_monster_dino:core/tick/animation/event/roundforce/attack_tail
#
# アニメーションイベントハンドラ 尻尾攻撃・側面
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1003,AttackName:"Round",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:1.5,Player_Offset_Y:-1.0,Player_Offset_Z:4.0,\
    #         Player_Scale_X:4.5,Player_Scale_Y:5.2,Player_Scale_Z:4.0,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
    #         Entity_Offset_X:1.5,Entity_Offset_Y:-1.0,Entity_Offset_Z:4.0,\
    #         Entity_Scale_X:4.5,Entity_Scale_Y:5.2,Entity_Scale_Z:4.0\
    # }

# 攻撃実行
    execute if entity @s[tag=!Mns.Dino.State.HeadHeat] run function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1003,AttackName:"Round",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:1.5,Player_Offset_Y:-1.0,Player_Offset_Z:4.0,\
            Player_Scale_X:4.5,Player_Scale_Y:5.2,Player_Scale_Z:4.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
            Entity_Offset_X:1.5,Entity_Offset_Y:-1.0,Entity_Offset_Z:4.0,\
            Entity_Scale_X:4.5,Entity_Scale_Y:5.2,Entity_Scale_Z:4.0\
    }
    execute if entity @s[tag=Mns.Dino.State.HeadHeat] run function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1003,AttackName:"Round.Heat",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:1.5,Player_Offset_Y:-1.0,Player_Offset_Z:4.0,\
            Player_Scale_X:4.5,Player_Scale_Y:5.2,Player_Scale_Z:4.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
            Entity_Offset_X:1.5,Entity_Offset_Y:-1.0,Entity_Offset_Z:4.0,\
            Entity_Scale_X:4.5,Entity_Scale_Y:5.2,Entity_Scale_Z:4.0\
    }
