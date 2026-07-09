#> assets:object/10032.dino_breath/tick/attack
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# 検知用
    tag @s add Mns.Dino.Object.Breath

# 攻撃実行
    function mhdp_monsters:core/util/tick/event/apply_attack_distance.m {Uid:1003,AttackName:"Breath",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..5.2]",\
            Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,\
            Player_Distance:5.2,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Dino,distance=..5.2]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,\
            Entity_Distance:5.2\
    }

# 演出
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    particle explosion_emitter ^ ^ ^ 0.3 0.3 0.3 0 3
    particle lava ^ ^ ^ 1 1 1 0 10
    particle flame ~ ~ ~ 0.1 0.1 0.1 0.2 30

# 検知用
    tag @s remove Mns.Dino.Object.Breath
