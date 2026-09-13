#> assets:object/10040.valk_shot/tick/hit
#
# 射撃弾 着弾（旧 shot/shot/damage）
#
# @within function assets:object/10040.valk_shot/tick/

# 二重実行防止
    execute if entity @s[tag=10040.Hit] run return 0
    tag @s add 10040.Hit

# 攻撃実行（球状。怒り倍率のためモンスター root として実行）
    execute at @s as @n[type=item_display,tag=Mns.Root.Valk] run function mhdp_monsters:core/util/tick/event/apply_attack_distance.m {Uid:1004,AttackName:"Shot",\
        Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..2.5]",\
            Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,Player_Distance:2.5,\
        Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.Valk,distance=..2.5]",\
            Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,Entity_Distance:2.5\
    }

# 演出
    playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    particle explosion ^ ^0.7 ^ 0.8 0.8 0.8 0 6

# 爆発 VFX
    execute positioned ^ ^0.7 ^ rotated ~ 0 run function api:object/summon.m {ObjectId:10046}

# 消滅
    function assets:object/10040.valk_shot/remove/
