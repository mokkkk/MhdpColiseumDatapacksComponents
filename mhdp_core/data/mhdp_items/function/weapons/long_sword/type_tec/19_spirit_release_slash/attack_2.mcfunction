#> mhdp_items:weapons/short_sword/type_tec/1_spear_1/attack
#
# 突き1 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 命中判定
    execute anchored eyes positioned ^ ^ ^1 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^2 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^3 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^4 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit
    execute anchored eyes positioned ^ ^ ^5 positioned ~-0.5 ~-0.5 ~-0.5 run tag @e[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Hit

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# 攻撃用オブジェクト召喚
    scoreboard players operation @s Ply.Other.AttackTargetUuid = @n[tag=Temp.Victim] Entity.Uuid
    # データ設定
        execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
        execute store result storage api: Arg.Override.TargetUuid int 1 run scoreboard players get @n[tag=Temp.Victim] Entity.Uuid
    # 召喚
        function api:object/summon.m {ObjectId:11}

# 演出用VFXオブジェクト召喚
    # データ設定
        data modify storage api: Arg.Override.Tag set value "slash_strong"
        data modify storage api: Arg.Override.IsCounter set value false
        data modify storage api: Arg.Override.Rotation set value -1.5708
        data modify storage api: Arg.Override.Scale set value [7f,20f,7f]
    # 召喚
        execute rotated ~ 0 positioned ~ ~2.65 ~ positioned ^ ^ ^5.5 facing entity @s eyes run function api:object/summon.m {ObjectId:7}

# ゲージ色を下げる
    scoreboard players set @s Wpn.Ls.SpiritLevelGauge 0
    function mhdp_items:weapons/long_sword/util/down_spirit_level

# 終了
    tag @e[type=slime,tag=Temp.Victim] remove Temp.Victim
    tag @e[type=slime,tag=Temp.Hit] remove Temp.Hit
