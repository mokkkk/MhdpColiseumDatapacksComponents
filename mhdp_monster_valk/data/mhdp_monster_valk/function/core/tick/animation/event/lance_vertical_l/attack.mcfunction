#> mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/attack
#
# アニメーションイベントハンドラ 翼槍叩きつけ (振り下ろし当たり判定・main から positioned で実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/main

# デバッグ用
    function api:bounding/cuboid_preview.m {Uid:1004,AttackName:"Vertical.Left",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:2.0,Player_Offset_Z:0.0,\
            Player_Scale_X:5.0,Player_Scale_Y:7.0,Player_Scale_Z:4.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:2.0,Entity_Offset_Z:0.0,\
            Entity_Scale_X:5.0,Entity_Scale_Y:7.0,Entity_Scale_Z:4.0\
    }

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:1004,AttackName:"Vertical.Left",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
            Player_Offset_X:0.0,Player_Offset_Y:2.0,Player_Offset_Z:0.0,\
            Player_Scale_X:5.0,Player_Scale_Y:7.0,Player_Scale_Z:4.0,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..30]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:2.0,Entity_Offset_Z:0.0,\
            Entity_Scale_X:5.0,Entity_Scale_Y:7.0,Entity_Scale_Z:4.0\
    }

# 演出
    particle explosion ~ ~ ~ 1 0.1 1 0 10
    execute at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound entity.wither.break_block master @s ^ ^1 ^1 0.4 0.8 0.4
    playsound item.mace.smash_ground master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound item.mace.smash_ground master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^1.5 0.2 0.1 0.2 0.2 25 normal
    particle dust_pillar{block_state:"minecraft:sand"} ^ ^0.1 ^1.5 0.2 0.1 0.2 0.5 15 normal
    execute positioned ^1 ^ ^ rotated ~ 0 run function api:object/summon.m {ObjectId:16}
    execute positioned ^-1 ^ ^ rotated ~ 0 run function api:object/summon.m {ObjectId:16}
    execute positioned ^ ^1 ^ rotated ~ -90 run function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/particle_ring
