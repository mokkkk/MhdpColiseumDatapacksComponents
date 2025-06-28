#> assets:object/0005.targetting_arrow/tick/attack_tec
#
# 矢の召喚処理
#
# @within function assets:object/0005.targetting_arrow/tick/

# 攻撃
    # 通常
        data modify storage api: Arg set from storage mhdp_core:game_data WeaponAttackData.Bow.Tec.Shot.3
    # ビン補正
        # 強撃ビン
            execute if entity @s[tag=5.Bin.Strong] run function assets:object/0005.targetting_arrow/tick/attack_tec_bottle_strong

# 攻撃実行
    execute as @a[tag=5.TargetPlayer] if entity @n[tag=Temp.Victim] run function api:damage_player_to_entity

# ゲージ上昇
    execute as @a[tag=5.TargetPlayer] run scoreboard players add @s Wpn.Bw.Gauge 5
