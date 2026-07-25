#> mhdp_monster_dino:core/tick/animation/event/bite/attack_head
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1003,AttackName:"BiteCombo",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:1.0,Player_Offset_Y:1.0,Player_Offset_Z:1.0,\
    #         Player_Scale_X:2.0,Player_Scale_Y:2.0,Player_Scale_Z:2.0,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
    #         Entity_Offset_X:1.0,Entity_Offset_Y:1.0,Entity_Offset_Z:1.0,\
    #         Entity_Scale_X:2.0,Entity_Scale_Y:2.0,Entity_Scale_Z:2.0\
    # }

# 攻撃実行
    execute if entity @s[tag=!Mns.Dino.State.HeadHeat] run function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1003,AttackName:"BiteCombo",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:1.0,Player_Offset_Y:1.0,Player_Offset_Z:1.0,\
            Player_Scale_X:2.0,Player_Scale_Y:2.0,Player_Scale_Z:2.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
            Entity_Offset_X:1.0,Entity_Offset_Y:1.0,Entity_Offset_Z:1.0,\
            Entity_Scale_X:2.0,Entity_Scale_Y:2.0,Entity_Scale_Z:2.0\
    }
    execute if entity @s[tag=Mns.Dino.State.HeadHeat] run function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1003,AttackName:"BiteCombo.Heat",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:1.0,Player_Offset_Y:1.0,Player_Offset_Z:1.0,\
            Player_Scale_X:2.0,Player_Scale_Y:2.0,Player_Scale_Z:2.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
            Entity_Offset_X:1.0,Entity_Offset_Y:1.0,Entity_Offset_Z:1.0,\
            Entity_Scale_X:2.0,Entity_Scale_Y:2.0,Entity_Scale_Z:2.0\
    }

# 演出
    execute if entity @s[tag=Mns.Dino.State.HeadHeat] run particle flame ~ ~ ~ 0.1 0.1 0.1 0.1 3
