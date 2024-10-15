#> mhdp_items:weapons/bow/shot/shower/hit
#
# 矢の処理
#
# @within function mhdp_items:/**

# 一時タグ消去
    tag @s remove Temp.This

# 攻撃対象を取得
    tag @n[type=slime,tag=Mns.HitBox] add Temp.Victim
    scoreboard players operation @s Ply.Other.AttackTargetUuid = @n[type=slime,tag=Mns.HitBox,tag=Temp.Victim] Entity.Uuid
    tag @n[type=slime,tag=Mns.HitBox,tag=Temp.Victim] remove Temp.Victim
    
# クリティカル距離設定
    scoreboard players set #mhdp_temp_crit_min MhdpCore 3
    scoreboard players set #mhdp_temp_crit_max MhdpCore 11
    execute if score #mhdp_temp_crit_min MhdpCore <= @s Mns.Shot.Timer if score @s Mns.Shot.Timer <= #mhdp_temp_crit_max MhdpCore run tag @s add Temp.IsCrit

# 終了
    tag @s add IsHit
    scoreboard players reset #mhdp_temp_crit_min MhdpCore
    scoreboard players reset #mhdp_temp_crit_max MhdpCore
