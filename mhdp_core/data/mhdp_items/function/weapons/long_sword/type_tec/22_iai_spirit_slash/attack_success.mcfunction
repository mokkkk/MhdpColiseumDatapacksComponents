#> mhdp_items:weapons/short_sword/type_tec/1_spear_1/attack
#
# 突き1 攻撃判定
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 命中判定
    function api:bounding/cylinder.m {Selector:"@e[type=slime,tag=Mns.HitBox]",Tag:"Temp.Hit",Radius:6.0,Height:3.0}

# ターゲット決定
    execute if entity @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit] run say ひっと
    execute as @e[type=slime,tag=Mns.HitBox,tag=Temp.Hit,sort=nearest,limit=1] run tag @s add Temp.Victim

# 非ヒット時、ここで終了
    execute unless entity @e[type=slime,tag=Mns.HitBox,tag=Temp.Victim] run tag @e[type=slime,tag=Temp.Hit] remove Temp.Hit

# ヒットストップ    
    execute if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.HitStopTimer 1

# ヒット時、練気色変更
    execute if entity @n[tag=Temp.Victim] run scoreboard players set @s Wpn.Ls.SpiritGauge 1000
    execute if entity @n[tag=Temp.Victim] run function mhdp_items:weapons/long_sword/util/up_spirit_level

# 攻撃用オブジェクト召喚
    scoreboard players operation @s Ply.Other.AttackTargetUuid = @n[tag=Temp.Victim] Entity.Uuid
    # データ設定
        execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
        execute store result storage api: Arg.Override.TargetUuid int 1 run scoreboard players get @n[tag=Temp.Victim] Entity.Uuid
        execute if score @s Wpn.Ls.SpiritLevel matches ..1 run data modify storage api: Arg.Override.Color set value "White"
        execute if score @s Wpn.Ls.SpiritLevel matches 2 run data modify storage api: Arg.Override.Color set value "Yellow"
        execute if score @s Wpn.Ls.SpiritLevel matches 3.. run data modify storage api: Arg.Override.Color set value "Red"
    # 召喚
        function api:object/summon.m {ObjectId:12}

# 終了
    tag @e[type=slime,tag=Temp.Hit] remove Temp.Hit
