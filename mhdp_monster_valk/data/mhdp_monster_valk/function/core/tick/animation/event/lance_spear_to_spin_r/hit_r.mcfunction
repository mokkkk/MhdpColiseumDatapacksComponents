#> mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/hit_r
#
# アニメーションイベントハンドラ 翼槍回転斬り (右翼爪・突き 当たり判定・at_locator から実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/attack_r

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Spear.Right",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
    #         Player_Scale_X:3.5,Player_Scale_Y:3.5,Player_Scale_Z:3.5,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
    #         Entity_Scale_X:3.5,Entity_Scale_Y:3.5,Entity_Scale_Z:3.5\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Spear.Right",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
            Player_Scale_X:3.5,Player_Scale_Y:3.5,Player_Scale_Z:3.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
            Entity_Scale_X:3.5,Entity_Scale_Y:3.5,Entity_Scale_Z:3.5\
    }

# 演出
    particle dust{color:[1.000,0.000,0.152],scale:3} ^ ^ ^-3 0.5 0.5 0.5 0.15 2
    particle crimson_spore ^ ^ ^-3 0.3 0.3 0.3 1 30
