#> mhdp_monster_valk:core/tick/animation/event/lance_voice/attack
#
# アニメーションイベントハンドラ 咆哮
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_voice/main

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack_distance.m {Uid:1004,AttackName:"Voice",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..18.0]",\
            Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
            Player_Distance:18.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..18.0]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
            Entity_Distance:18.0\
    }
