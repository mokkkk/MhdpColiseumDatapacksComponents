#> mhdp_monster_ranposu:core/tick/animation/event/move_claw/attack
#
# アニメーションイベントハンドラ 移動ひっかき
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# # デバッグ用
#         function api:bounding/cuboid_preview.m {Uid:1001,AttackName:"MoveClaw",\
#         Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
#             Player_Offset_X:0.0,Player_Offset_Y:1.6,Player_Offset_Z:2.0,\
#             Player_Scale_X:2.5,Player_Scale_Y:2.5,Player_Scale_Z:2.5,\
#         Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Ranposu,distance=..30]",\
#             Entity_Offset_X:0.0,Entity_Offset_Y:1.6,Entity_Offset_Z:2.0,\
#             Entity_Scale_X:2.5,Entity_Scale_Y:2.5,Entity_Scale_Z:2.5\
#     }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1001,AttackName:"MoveClaw",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:1.6,Player_Offset_Z:2.0,\
            Player_Scale_X:2.5,Player_Scale_Y:2.5,Player_Scale_Z:2.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Ranposu,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:1.6,Entity_Offset_Z:2.0,\
            Entity_Scale_X:2.5,Entity_Scale_Y:2.5,Entity_Scale_Z:2.5\
    }
