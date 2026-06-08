#> mhdp_monster_ranposu:core/tick/animation/event/tail_left/attack
#
# アニメーションイベントハンドラ 尻尾攻撃
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# ヒット確認
    # デバッグ用
        # execute positioned ^ ^1.6 ^-3 run function api:bounding/cuboid_with_preview.m {Selector:"@a[tag=Ply.State.EnableDamage,distance=..20]",Tag:"Temp.Hit",X:"2",Y:"1.9",Z:"3"}
        # execute positioned ^ ^1.6 ^-3 run function api:bounding/cuboid_with_preview_blue.m {Selector:"@e[type=shulker,tag=Entity.EnableDamage,distance=..20]",Tag:"Temp.Hit",X:"2",Y:"1.9",Z:"3"}

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1001,AttackName:"Tail",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:1.6,Player_Offset_Z:-3.0,\
            Player_Scale_X:2.0,Player_Scale_Y:1.9,Player_Scale_Z:3.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Ranposu,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:1.6,Entity_Offset_Z:-3.0,\
            Entity_Scale_X:2.0,Entity_Scale_Y:1.9,Entity_Scale_Z:3.0\
    }
