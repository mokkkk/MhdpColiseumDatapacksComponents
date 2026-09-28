#> mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/hit
#
# アニメーションイベントハンドラ 薙ぎ払い・怒り時 (当たり判定・at_locator から実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/attack

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Sweep.Anger.Right",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:1.0,Player_Offset_Y:2.5,Player_Offset_Z:1.0,\
    #         Player_Scale_X:4.5,Player_Scale_Y:6.0,Player_Scale_Z:3.0,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:1.0,Entity_Offset_Y:2.5,Entity_Offset_Z:1.0,\
    #         Entity_Scale_X:4.5,Entity_Scale_Y:6.0,Entity_Scale_Z:3.0\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Sweep.Anger.Right",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:1.0,Player_Offset_Y:2.5,Player_Offset_Z:1.0,\
            Player_Scale_X:4.5,Player_Scale_Y:6.0,Player_Scale_Z:3.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:1.0,Entity_Offset_Y:2.5,Entity_Offset_Z:1.0,\
            Entity_Scale_X:4.5,Entity_Scale_Y:6.0,Entity_Scale_Z:3.0\
    }

# 演出
    particle dust{color:[1.000,0.000,0.152],scale:4} ^ ^ ^ 0.5 0.5 0.5 0.15 3
    particle dust{color:[1.000,0.000,0.152],scale:4} ^ ^2.5 ^ 0.5 0.5 0.5 0.15 3
    particle dust{color:[1.000,0.000,0.152],scale:4} ^ ^5 ^ 0.5 0.5 0.5 0.15 3
