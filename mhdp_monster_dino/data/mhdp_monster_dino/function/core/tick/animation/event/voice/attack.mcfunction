#> mhdp_monster_dino:core/tick/animation/event/voice/attack
#
# アニメーションイベントハンドラ 咆哮
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack_distance.m {Uid:1003,AttackName:"Voice",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..15.0]",\
            Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
            Player_Distance:15.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..15.0]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
            Entity_Distance:15.0\
    }
