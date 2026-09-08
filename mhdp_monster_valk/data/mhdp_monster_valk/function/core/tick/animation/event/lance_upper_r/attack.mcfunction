#> mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack
#
# アニメーションイベントハンドラ 翼槍突き上げ (前方一直線の当たり判定・main から positioned/rotated で実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/main

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Upper",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:28.5,\
    #         Player_Scale_X:3.4,Player_Scale_Y:3.4,Player_Scale_Z:45.0,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
    #         Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:28.5,\
    #         Entity_Scale_X:3.4,Entity_Scale_Y:3.4,Entity_Scale_Z:45.0\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Upper",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:28.5,\
            Player_Scale_X:3.4,Player_Scale_Y:3.4,Player_Scale_Z:43.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:28.5,\
            Entity_Scale_X:3.4,Entity_Scale_Y:3.4,Entity_Scale_Z:43.0\
    }

# 演出
    execute positioned ^ ^ ^ run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_effect
    execute positioned ^ ^ ^5 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_effect
    execute positioned ^ ^ ^10 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_effect
    execute positioned ^ ^ ^15 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_effect
    execute positioned ^ ^ ^20 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_effect
    execute positioned ^ ^ ^25 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_effect
    execute positioned ^ ^ ^30 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_effect
    execute positioned ^ ^ ^35 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_effect
    execute positioned ^ ^ ^40 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_effect
    execute positioned ^ ^ ^45 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_effect
    execute positioned ^ ^ ^50 run function mhdp_monster_valk:core/tick/animation/event/lance_upper_r/attack_effect

# 演出
    execute at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound entity.wither.break_block master @s ^ ^1 ^1 0.4 0.8 0.4
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
