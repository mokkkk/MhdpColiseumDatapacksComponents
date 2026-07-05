#> assets:object/10031.dino_tail_flame/tick/attack
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# 検知用
    tag @s add Mns.Dino.Object.Flame

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1003,AttackName:"TailFlame.Shot",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:1.25,Player_Offset_Z:0.0,\
    #         Player_Scale_X:2.5,Player_Scale_Y:2.5,Player_Scale_Z:2.5,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:1.25,Entity_Offset_Z:0.0,\
    #         Entity_Scale_X:2.5,Entity_Scale_Y:2.5,Entity_Scale_Z:2.5\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1003,AttackName:"TailFlame.Shot",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:1.25,Player_Offset_Z:0.0,\
            Player_Scale_X:2.5,Player_Scale_Y:3.5,Player_Scale_Z:2.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:1.25,Entity_Offset_Z:0.0,\
            Entity_Scale_X:2.5,Entity_Scale_Y:3.5,Entity_Scale_Z:2.5\
    }

# 検知用
    tag @s remove Mns.Dino.Object.Flame
