#> mhdp_monsters:core/util/damage/reaction_bomb_schedule_marker
# 
# 汎用処理 爆破効果発動
#
# @within function mhdp_monsters:core/util/damage/reaction_bomb_schedule

# 実行者とターゲットを設定
    scoreboard players operation #mhdp_temp_id MhdpCore = @s Ply.Uid
    execute as @a if score @s Ply.Uid = #mhdp_temp_id MhdpCore run tag @s add Temp.Attacker
    scoreboard players operation #mhdp_temp_id MhdpCore = @s Ply.Other.AttackTargetUuid
    execute as @e[type=slime,tag=Mns.HitBox] if score @s Entity.Uuid = #mhdp_temp_id MhdpCore run tag @s add Temp.Victim

# 演出
    execute at @n[tag=Temp.Victim] run particle explosion ~ ~ ~ 0.4 0.4 0.4 0 3
    execute at @n[tag=Temp.Victim] run particle smoke ~ ~ ~ 0.3 0.3 0.3 0.4 8
    execute at @n[tag=Temp.Victim] run playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7

# ダメージ
    data modify storage mhdp_core:temp Damage set value {AttackValue:100,AttackType:"Bomb",DamageMult:100,PartDamageMult:200,IsDecreseSharpness:false}
    execute store result storage mhdp_core:temp Damage.AttackValue int 1 run scoreboard players get @s Mns.Bomb.Effect.Value
    execute as @a[tag=Temp.Attacker] run function mhdp_core:player/damage/player_to_entity/main_fixed_damage

# 終了
    scoreboard players reset #mhdp_temp_id MhdpCore
    tag @a[tag=Temp.Attacker] remove Temp.Attacker
    tag @e[type=slime,tag=Mns.HitBox,tag=Temp.Victim] remove Temp.Victim
    kill @s
