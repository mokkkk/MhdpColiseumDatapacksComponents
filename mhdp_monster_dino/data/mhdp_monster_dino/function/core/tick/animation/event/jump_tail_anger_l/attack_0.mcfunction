#> mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_l/attack
#
# アニメーションイベントハンドラ 嚙みつき
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# デバッグ用
    # function api:bounding/cuboid_preview.m {Uid:1003,AttackName:"TailJump",\
    #     Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
    #         Player_Offset_X:-0.7,Player_Offset_Y:0.0,Player_Offset_Z:6.0,\
    #         Player_Scale_X:2.4,Player_Scale_Y:4.0,Player_Scale_Z:7.5,\
    #     Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
    #         Entity_Offset_X:-0.7,Entity_Offset_Y:0.0,Entity_Offset_Z:6.0,\
    #         Entity_Scale_X:2.4,Entity_Scale_Y:4.0,Entity_Scale_Z:7.5\
    # }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1003,AttackName:"TailJump",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:-0.7,Player_Offset_Y:0.0,Player_Offset_Z:6.0,\
            Player_Scale_X:2.4,Player_Scale_Y:4.0,Player_Scale_Z:7.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..30]",\
            Entity_Offset_X:-0.7,Entity_Offset_Y:0.0,Entity_Offset_Z:6.0,\
            Entity_Scale_X:2.4,Entity_Scale_Y:4.0,Entity_Scale_Z:7.5\
    }

# 効果音演出
    playsound entity.ravager.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    playsound entity.ravager.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound item.mace.smash_air master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound item.mace.smash_air master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    playsound entity.iron_golem.death master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound entity.iron_golem.death master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.57


# 攻撃が建築物に当たった場合、演出無効化
    execute if entity @s[tag=Mns.Temp.HitObject] run return 0

# ひび割れ演出
    execute positioned ^ ^1 ^7 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_l/attack_particle
    execute positioned ^ ^1 ^9 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_l/attack_particle
    execute positioned ^ ^1 ^5 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_l/attack_particle
