#> mhdp_monster_dino:core/tick/animation/event/tail_back_r/attack_tail
#
# アニメーションイベントハンドラ 尻尾攻撃・背面
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1003,AttackName:"TailBack",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:1.5,Player_Offset_Y:0.0,Player_Offset_Z:2.0,\
    #         Player_Scale_X:2.5,Player_Scale_Y:3.2,Player_Scale_Z:2.0,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
    #         Entity_Offset_X:1.5,Entity_Offset_Y:0.0,Entity_Offset_Z:2.0,\
    #         Entity_Scale_X:2.5,Entity_Scale_Y:3.2,Entity_Scale_Z:3.5\
    # }

# # 攻撃実行
    execute if entity @s[tag=!Mns.Dino.State.HeadHeat] run function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1003,AttackName:"TailBack",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:1.5,Player_Offset_Y:0.0,Player_Offset_Z:2.0,\
            Player_Scale_X:2.5,Player_Scale_Y:3.2,Player_Scale_Z:2.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
            Entity_Offset_X:1.5,Entity_Offset_Y:0.0,Entity_Offset_Z:2.0,\
            Entity_Scale_X:2.5,Entity_Scale_Y:3.2,Entity_Scale_Z:3.5\
    }
    execute if entity @s[tag=Mns.Dino.State.HeadHeat] run function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1003,AttackName:"TailBack.Heat",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:1.5,Player_Offset_Y:0.0,Player_Offset_Z:2.0,\
            Player_Scale_X:2.5,Player_Scale_Y:3.2,Player_Scale_Z:2.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
            Entity_Offset_X:1.5,Entity_Offset_Y:0.0,Entity_Offset_Z:2.0,\
            Entity_Scale_X:2.5,Entity_Scale_Y:3.2,Entity_Scale_Z:3.5\
    }
