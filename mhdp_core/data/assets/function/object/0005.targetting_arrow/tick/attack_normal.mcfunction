#> assets:object/0005.targetting_arrow/tick/attack_normal
#
# 矢の召喚処理
#
# @within function assets:object/0005.targetting_arrow/tick/

# 攻撃
    # ヒット音
        execute as @a[tag=5.TargetPlayer] at @s run stopsound @s master entity.arrow.hit_player
        execute as @a[tag=5.TargetPlayer] at @s run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    # 通常
        data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Normal.Targetting
    # 演出
        execute at @s run particle explosion ~ ~ ~ 0 0 0 0 1

# 攻撃実行
    execute as @a[tag=5.TargetPlayer] if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity
