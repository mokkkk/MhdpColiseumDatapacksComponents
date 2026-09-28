#> mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_r/hit_swing
#
# アニメーションイベントハンドラ 振りむき翼槍叩きつけ 振り下ろし中の当たり判定 (at_locator pos_wing_r_3 から実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_vertical_turn_r/attack_swing

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Vertical.Right",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
    #         Player_Scale_X:3.0,Player_Scale_Y:3.0,Player_Scale_Z:3.0,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
    #         Entity_Scale_X:3.0,Entity_Scale_Y:3.0,Entity_Scale_Z:3.0\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Vertical.Right",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
            Player_Scale_X:3.0,Player_Scale_Y:3.0,Player_Scale_Z:3.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
            Entity_Scale_X:3.0,Entity_Scale_Y:3.0,Entity_Scale_Z:3.0\
    }
