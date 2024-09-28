#> mhdp_items:weapons/bow/shot/normal/attack
#
# 矢の処理
#
# @within function mhdp_items:/**

# 攻撃主を取得
    scoreboard players operation #mhdp_temp_target_player_uid Ply.Uid = @s Ply.Uid
    execute as @a if score @s Ply.Uid = #mhdp_temp_target_player_uid Ply.Uid run tag @s add Ply.Temp.TargetSub
    scoreboard players reset #mhdp_temp_target_player_uid

# 攻撃対象を設定
    execute positioned ~-0.5 ~-0.5 ~-0.5 run tag @n[type=slime,tag=Mns.HitBox,dx=1,dy=1,dz=1] add Temp.Victim

# 攻撃
    execute if score @s Wpn.Bw.ChargeCount matches ..0 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.1
    execute if score @s Wpn.Bw.ChargeCount matches 1 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.2
    execute if score @s Wpn.Bw.ChargeCount matches 2 run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.3
    execute if score @s Wpn.Bw.ChargeCount matches 3.. run data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.4
    execute as @a[tag=Ply.Temp.TargetSub] if entity @e[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# 終了
    tag @a remove Ply.Temp.TargetSub
    kill @s
