#> mhdp_monster_ranposu:core/tick/animation/event/bite/attack
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# # デバッグ用
#     function api:bounding/cuboid_preview.m {Uid:1001,AttackName:"Bite",\
#         Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
#             Player_Offset_X:0.0,Player_Offset_Y:1.6,Player_Offset_Z:5.0,\
#             Player_Scale_X:1.8,Player_Scale_Y:1.9,Player_Scale_Z:2.0,\
#         Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Ranposu,distance=..30]",\
#             Entity_Offset_X:0.0,Entity_Offset_Y:1.6,Entity_Offset_Z:4.1,\
#             Entity_Scale_X:2.0,Entity_Scale_Y:3.0,Entity_Scale_Z:3.0\
#     }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1001,AttackName:"Bite",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:1.6,Player_Offset_Z:5.0,\
            Player_Scale_X:1.8,Player_Scale_Y:1.9,Player_Scale_Z:2.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Ranposu,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:1.6,Entity_Offset_Z:4.1,\
            Entity_Scale_X:2.0,Entity_Scale_Y:3.0,Entity_Scale_Z:3.0\
    }
