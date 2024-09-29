#> mhdp_items:weapons/bow/type_tec/7_shot_horming/attack_burst
#
# 導ノ矢 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_tec/7_shot_horming/main

# ターゲット取得
    scoreboard players operation #mhdo_temp_uuid MhdpCore = @s Wpn.Bw.HormingTarget
    execute as @e[type=slime,tag=Mns.HitBox] if score @s Entity.Uuid = #mhdo_temp_uuid MhdpCore run tag @s add Temp.Horming.Target

# 攻撃
    execute as @n[type=slime,tag=Mns.HitBox,tag=Temp.Horming.Target] run tag @s add Temp.Victim
    execute at @n[tag=Temp.Victim] run particle explosion ~ ~1 ~ 0 0 0 0 1
    execute at @n[tag=Temp.Victim] run particle firework ~ ~1 ~ 0 0 0 0.3 15
    execute at @n[tag=Temp.Victim] run playsound entity.firework_rocket.blast master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    data modify storage mhdp_core:temp Damage set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Horming.Burst
    execute if entity @e[tag=Temp.Victim] run function mhdp_core:player/damage/player_to_entity/main

# 終了
    tag @e[tag=Temp.Horming.Target] remove Temp.Horming.Target
    scoreboard players reset #mhdo_temp_uuid MhdpCore
    scoreboard players reset @s Wpn.Bw.HormingTarget
    tag @s remove Ply.Weapon.Bow.IsHorming
