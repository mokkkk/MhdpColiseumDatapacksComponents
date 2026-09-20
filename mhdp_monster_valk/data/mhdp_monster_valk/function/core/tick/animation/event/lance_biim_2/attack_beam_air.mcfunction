#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_air
#
# アニメーションイベントハンドラ 龍閃 ビーム (空中)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/main

# デバッグ用
    # execute facing entity @n[type=area_effect_cloud,tag=Mns.BeamPos.Valk] feet run function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Beam",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:30.5,\
    #         Player_Scale_X:5.5,Player_Scale_Y:5.5,Player_Scale_Z:30.0,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:30.5,\
    #         Entity_Scale_X:5.5,Entity_Scale_Y:5.5,Entity_Scale_Z:30.0\
    # }

# 攻撃実行
    execute facing entity @n[type=area_effect_cloud,tag=Mns.BeamPos.Valk] feet run function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Beam",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:30.5,\
            Player_Scale_X:5.5,Player_Scale_Y:5.5,Player_Scale_Z:30.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:30.5,\
            Entity_Scale_X:5.5,Entity_Scale_Y:5.5,Entity_Scale_Z:30.0\
    }
