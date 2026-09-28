#> mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/hit_spin
#
# アニメーションイベントハンドラ 翼槍回転斬り (右翼爪・回転斬り 当たり判定・at_locator から実行)
# 翼の可動域に沿って横に3点判定する
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/attack_spin

# デバッグ用 (中心)
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"SpearSpin.Right",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
    #         Player_Scale_X:3.0,Player_Scale_Y:3.0,Player_Scale_Z:3.0,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
    #         Entity_Scale_X:3.0,Entity_Scale_Y:3.0,Entity_Scale_Z:3.0\
    # }

# 攻撃実行 (中心)
    function mhdp_monsters:core/util/tick/event/apply_attack_with_entitypos.m {Uid:1004,AttackName:"SpearSpin.Right",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",EntityPosSelector:"@n[type=item_display,tag=Mns.Root.Valk]",\
            Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
            Player_Scale_X:3.0,Player_Scale_Y:3.0,Player_Scale_Z:3.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
            Entity_Scale_X:3.0,Entity_Scale_Y:3.0,Entity_Scale_Z:3.0\
    }
    particle cloud ^ ^ ^-3 0.3 0.3 0.3 0.1 3

# デバッグ用 (翼付け根側 +2)
    # execute positioned ^2 ^ ^ run function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"SpearSpin.Right",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
    #         Player_Scale_X:3.0,Player_Scale_Y:3.0,Player_Scale_Z:3.0,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
    #         Entity_Scale_X:3.0,Entity_Scale_Y:3.0,Entity_Scale_Z:3.0\
    # }

# 攻撃実行 (翼付け根側 +2)
    execute positioned ^2 ^ ^ run function mhdp_monsters:core/util/tick/event/apply_attack_with_entitypos.m {Uid:1004,AttackName:"SpearSpin.Right",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",EntityPosSelector:"@n[type=item_display,tag=Mns.Root.Valk]",\
            Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
            Player_Scale_X:3.0,Player_Scale_Y:3.0,Player_Scale_Z:3.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
            Entity_Scale_X:3.0,Entity_Scale_Y:3.0,Entity_Scale_Z:3.0\
    }
    execute positioned ^2 ^ ^ run particle cloud ^ ^ ^-3 0.3 0.3 0.3 0.1 2

# デバッグ用 (翼付け根側 +4)
    # execute positioned ^4 ^ ^ run function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"SpearSpin.Right",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
    #         Player_Scale_X:3.0,Player_Scale_Y:3.0,Player_Scale_Z:3.0,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
    #         Entity_Scale_X:3.0,Entity_Scale_Y:3.0,Entity_Scale_Z:3.0\
    # }

# 攻撃実行 (翼付け根側 +4)
    execute positioned ^4 ^ ^ run function mhdp_monsters:core/util/tick/event/apply_attack_with_entitypos.m {Uid:1004,AttackName:"SpearSpin.Right",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",EntityPosSelector:"@n[type=item_display,tag=Mns.Root.Valk]",\
            Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
            Player_Scale_X:3.0,Player_Scale_Y:3.0,Player_Scale_Z:3.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
            Entity_Scale_X:3.0,Entity_Scale_Y:3.0,Entity_Scale_Z:3.0\
    }
    execute positioned ^4 ^ ^ run particle cloud ^ ^ ^-3 0.3 0.3 0.3 0.1 2
