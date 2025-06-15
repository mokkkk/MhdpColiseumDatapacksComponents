#> mhdp_items:weapons/bow/type_tec/8_horming/attack_burst
#
# 導ノ矢 攻撃判定
#
# @within function mhdp_items:weapons/bow/type_tec/7_shot_horming/main

# ターゲット取得
    scoreboard players operation #mhdp_temp_uid MhdpCore = @s Wpn.Bw.HormingTarget
    execute as @e[type=slime,tag=Mns.HitBox] if score @s Entity.Uuid = #mhdp_temp_uid MhdpCore run tag @s add Temp.Horming.Target

# 攻撃
    execute as @n[type=slime,tag=Mns.HitBox,tag=Temp.Horming.Target] run tag @s add Temp.Victim
    execute at @n[tag=Temp.Victim] run particle explosion ~ ~1 ~ 0 0 0 0 1
    execute at @n[tag=Temp.Victim] run particle firework ~ ~1 ~ 0 0 0 0.3 15
    execute at @n[tag=Temp.Victim] run playsound entity.firework_rocket.blast master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Horming.Burst

# 攻撃実行
    execute if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    tag @e[tag=Temp.Horming.Target] remove Temp.Horming.Target
    scoreboard players reset #mhdp_temp_uid MhdpCore
    scoreboard players reset @s Wpn.Bw.HormingTarget
    tag @s remove Ply.Weapon.Bow.IsHorming
