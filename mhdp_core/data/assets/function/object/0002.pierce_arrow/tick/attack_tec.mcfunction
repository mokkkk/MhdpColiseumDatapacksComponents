#> assets:object/0001.normal_arrow/tick/attack_tec
#
# 矢の召喚処理
#
# @within function assets:object/0001.normal_arrow/tick/

# 一度でもヒットした場合、ホーミングしなくなる
    tag @s add 2.HormingEnd

# ヒット数増加
    scoreboard players add @s MhdpCore 1
    scoreboard players add @s ObjectTick 1

# クリティカル距離設定
    scoreboard players set #mhdp_temp_crit_min MhdpCore 3
    scoreboard players set #mhdp_temp_crit_max MhdpCore 12
    execute if score #mhdp_temp_crit_min MhdpCore <= @s ObjectTick if score @s ObjectTick <= #mhdp_temp_crit_max MhdpCore run tag @s add Temp.IsCrit

# 攻撃
    # 通常
        execute if score @s Wpn.Bw.ChargeCount matches ..0 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.1
        execute if score @s Wpn.Bw.ChargeCount matches 1 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.2
        execute if score @s Wpn.Bw.ChargeCount matches 2 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.3
        execute if score @s Wpn.Bw.ChargeCount matches 3.. run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.4
    # クリティカル距離
        execute if entity @s[tag=Temp.IsCrit] as @a[tag=2.TargetPlayer] at @s run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches ..0 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.1.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 1 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.2.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 2 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.3.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 3.. run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Pierce.4.Crit
    # 導ノ矢補正
        execute if entity @a[tag=2.TargetPlayer,tag=Ply.Weapon.Bow.IsHorming] if score @a[tag=2.TargetPlayer,limit=1] Wpn.Bw.HormingTarget = @n[tag=Temp.Victim] Entity.Uuid run function mhdp_items:weapons/bow/shot/normal/attack_horming

# ゲージ上昇
    execute as @a[tag=2.TargetPlayer] run scoreboard players add @s Wpn.Bw.Gauge 3

# 攻撃実行
    execute as @a[tag=2.TargetPlayer] if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    scoreboard players reset #mhdp_temp_crit_min MhdpCore
    scoreboard players reset #mhdp_temp_crit_max MhdpCore
    tag @a remove 2.TargetPlayer
    execute if score @s MhdpCore matches 8.. run tag @s add 2.Death
