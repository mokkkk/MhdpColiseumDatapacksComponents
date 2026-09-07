#> mhdp_monster_valk:core/tick/animation/event/lance_vertical_r/attack_hand
#
# アニメーションイベントハンドラ 翼槍叩きつけ お手部分の当たり判定
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_vertical_r/main

# デバッグ用
    # execute positioned ^1.5 ^1 ^8 run function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Vertical.Hand",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
    #         Player_Scale_X:1.8,Player_Scale_Y:1.8,Player_Scale_Z:1.8,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
    #         Entity_Scale_X:1.8,Entity_Scale_Y:1.8,Entity_Scale_Z:1.8\
    # }

# 攻撃実行
    execute positioned ^1.5 ^1 ^8 run function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Vertical.Hand",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
            Player_Scale_X:1.8,Player_Scale_Y:1.8,Player_Scale_Z:1.8,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
            Entity_Scale_X:1.8,Entity_Scale_Y:1.8,Entity_Scale_Z:1.8\
    }

# 演出
    particle block{block_state:"minecraft:sand"} ^1.5 ^1 ^8 0.4 0 0.4 0 10
