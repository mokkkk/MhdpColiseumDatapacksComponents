#> mhdp_items:weapons/short_sword/type_normal/1_spear_1/attack
#
# 突き1 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_normal/1_charge/change_to_chargeattack

# 命中判定
    execute rotated ~ 0 positioned ^ ^ ^2 run function api:bounding/cylinder.m {Selector:"@e[type=slime,tag=Mns.HitBox]",Tag:"Temp.Hit",Radius:6.0,Height:3.0}

# ターゲット決定
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# ヒットストップ    
    execute if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 1

# ヒット時、練気色変更
    execute if entity @s[tag=!Ply.Flag.Hit] if entity @n[tag=Temp.Victim] run function mhdp_items:weapons/long_sword/util/up_spirit_level
    execute if entity @s[tag=!Ply.Flag.Hit] if entity @n[tag=Temp.Victim] run tag @s add Ply.Flag.Hit

# 攻撃用オブジェクト召喚
    scoreboard players operation @s Ply.Other.AttackTargetUuid = @n[tag=Temp.Victim] Entity.Uuid
    # データ設定
        execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
        execute store result storage api: Arg.Override.TargetUuid int 1 run scoreboard players get @n[tag=Temp.Victim] Entity.Uuid
    # 召喚
        execute if entity @n[tag=Temp.Victim] run function api:object/summon.m {ObjectId:13}

# 攻撃
    data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.LongSword.Normal.SakuraSlash.2
    execute if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    tag @e[type=slime,tag=Temp.Hit] remove Temp.Hit
