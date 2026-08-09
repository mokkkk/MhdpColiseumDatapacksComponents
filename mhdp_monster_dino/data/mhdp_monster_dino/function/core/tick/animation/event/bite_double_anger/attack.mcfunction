#> mhdp_monster_dino:core/tick/animation/event/bite_double_anger/attack
#
# アニメーションイベントハンドラ 2連嚙みつき
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1003,AttackName:"BiteDouble",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:6.0,\
    #         Player_Scale_X:2.0,Player_Scale_Y:4.0,Player_Scale_Z:2.0,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:6.0,\
    #         Entity_Scale_X:2.0,Entity_Scale_Y:4.0,Entity_Scale_Z:2.0\
    # }

# 攻撃実行
    execute if entity @s[tag=!Mns.Dino.State.HeadHeat] run function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1003,AttackName:"BiteDouble",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:6.0,\
            Player_Scale_X:2.8,Player_Scale_Y:4.0,Player_Scale_Z:2.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:6.0,\
            Entity_Scale_X:2.8,Entity_Scale_Y:4.0,Entity_Scale_Z:2.0\
    }
    execute if entity @s[tag=Mns.Dino.State.HeadHeat] run function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1003,AttackName:"BiteDouble.Heat",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:6.0,\
            Player_Scale_X:2.8,Player_Scale_Y:4.0,Player_Scale_Z:2.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:6.0,\
            Entity_Scale_X:2.8,Entity_Scale_Y:4.0,Entity_Scale_Z:2.0\
    }

# 演出
    playsound entity.wither.break_block master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.6
