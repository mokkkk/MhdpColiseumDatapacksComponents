#> mhdp_monsters:core/util/damage/reaction_bomb
# 
# 汎用処理 爆破効果発動
#
# @within function mhdp_monsters:/**

# 耐性値増加
    scoreboard players operation @s Mns.Bomb.Damage.Max *= #const_bomb_damage_multiply Const
    execute store result score @s Mns.Bomb.Damage run scoreboard players operation @s Mns.Bomb.Damage.Max /= #const_100 Const

# 対象保存用のmarker召喚
    summon marker ~ ~ ~ {Tags:["Temp.Bomb.Marker","Start"]}
    scoreboard players operation @n[type=marker,tag=Temp.Bomb.Marker,tag=Start] Ply.Uid = @a[tag=Temp.Attacker] Ply.Uid
    scoreboard players operation @n[type=marker,tag=Temp.Bomb.Marker,tag=Start] Ply.Other.AttackTargetUuid = @n[tag=Temp.Victim] Entity.Uuid
    scoreboard players operation @n[type=marker,tag=Temp.Bomb.Marker,tag=Start] Mns.Bomb.Effect.Value = @s Mns.Bomb.Effect.Value
    tag @n[type=marker,tag=Temp.Bomb.Marker,tag=Start] remove Start

# スケジュール開始
    schedule function mhdp_monsters:core/util/damage/reaction_bomb_schedule 1t append
