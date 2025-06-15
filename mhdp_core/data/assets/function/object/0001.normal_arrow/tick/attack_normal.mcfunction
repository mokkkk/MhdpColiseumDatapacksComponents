#> assets:object/0001.normal_arrow/tick/attack_normal
#
# 矢の召喚処理
#
# @within function assets:object/0001.normal_arrow/tick/

# クリティカル距離設定
    scoreboard players set #mhdp_temp_crit_min MhdpCore 1
    scoreboard players set #mhdp_temp_crit_max MhdpCore 10
    execute if entity @s[tag=1.IsFlyingShot] run scoreboard players set #mhdp_temp_crit_max MhdpCore 30
    execute if score #mhdp_temp_crit_min MhdpCore <= @s ObjectTick if score @s ObjectTick <= #mhdp_temp_crit_max MhdpCore run tag @s add Temp.IsCrit

# 攻撃データ取得
    # 通常
        execute if score @s Wpn.Bw.ChargeCount matches ..0 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.1
        execute if score @s Wpn.Bw.ChargeCount matches 1 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.2
        execute if score @s Wpn.Bw.ChargeCount matches 2 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.3
        execute if score @s Wpn.Bw.ChargeCount matches 3 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.4
        execute if score @s Wpn.Bw.ChargeCount matches 4.. run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.5
    # クリティカル距離
        execute if entity @s[tag=Temp.IsCrit] as @a[tag=1.TargetPlayer] at @s run stopsound @s master entity.arrow.hit_player
        execute if entity @s[tag=Temp.IsCrit] as @a[tag=1.TargetPlayer] at @s run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches ..0 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.1.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 1 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.2.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 2 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.3.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 3 run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.4.Crit
        execute if entity @s[tag=Temp.IsCrit] if score @s Wpn.Bw.ChargeCount matches 4.. run data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Shot.5.Crit
        # チュートリアル用処理
            execute if entity @s[tag=Temp.IsCrit] run tag @a[tag=1.TargetPlayer,tag=Ply.Temp.Tutorial.CritShot] remove Ply.Temp.Tutorial.CritShot
    
# 攻撃実行
    execute as @a[tag=1.TargetPlayer] if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# 終了
    scoreboard players reset #mhdp_temp_crit_min MhdpCore
    scoreboard players reset #mhdp_temp_crit_max MhdpCore

say attack