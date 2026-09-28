#> mhdp_monster_valk:core/tick/animation/event/comet_phase_4/attack
#
# アニメーションイベントハンドラ 彗星・着陸 (着弾当たり判定・main から実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/main

# デバッグ用
    execute rotated ~180 0 run function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Comet",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:9.5,\
            Player_Scale_X:15.0,Player_Scale_Y:14.0,Player_Scale_Z:27.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:9.5,\
            Entity_Scale_X:15.0,Entity_Scale_Y:14.0,Entity_Scale_Z:27.5\
    }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack_with_entitypos.m {Uid:1004,AttackName:"Comet",EntityPosSelector:"@n[type=item_display,tag=Mns.Root.Valk]",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:1.0,Player_Offset_Z:9.5,\
            Player_Scale_X:15.0,Player_Scale_Y:14.0,Player_Scale_Z:27.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:1.0,Entity_Offset_Z:9.5,\
            Entity_Scale_X:15.0,Entity_Scale_Y:14.0,Entity_Scale_Z:27.5\
    }

# 演出
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.7
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6
    playsound item.mace.smash_ground_heavy master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6
    playsound item.mace.smash_ground_heavy master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    playsound item.mace.smash_ground_heavy master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.8
    particle explosion_emitter ~ ~2 ~ 3 1 3 0 20 force
    particle gust_emitter_large ~ ~2 ~ 3 1 3 0 20 force
    particle large_smoke ~ ~2 ~ 3 1 3 0.1 100 force
    execute positioned ~ ~1 ~ rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/particle_ring
    execute positioned ~ ~2 ~ rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/particle_ring
    execute positioned ~ ~3 ~ rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_4/particle_ring
