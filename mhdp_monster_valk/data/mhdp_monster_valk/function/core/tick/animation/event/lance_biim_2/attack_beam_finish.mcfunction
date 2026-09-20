#> mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_finish
#
# アニメーションイベントハンドラ 龍閃 ビーム振り下ろし
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/main

# 演出用、壁に当たるまで再帰
    scoreboard players set #mhdp_temp_valk_beam_count MhdpCore 30
    function mhdp_monster_valk:core/tick/animation/event/lance_biim_2/attack_beam_finish_loop
    scoreboard players reset #mhdp_temp_valk_beam_count MhdpCore

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Beam",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:30.5,\
    #         Player_Scale_X:5.5,Player_Scale_Y:5.5,Player_Scale_Z:30.0,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:30.5,\
    #         Entity_Scale_X:5.5,Entity_Scale_Y:5.5,Entity_Scale_Z:30.0\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Beam",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:30.5,\
            Player_Scale_X:5.5,Player_Scale_Y:5.5,Player_Scale_Z:30.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:30.5,\
            Entity_Scale_X:5.5,Entity_Scale_Y:5.5,Entity_Scale_Z:30.0\
    }
