#> mhdp_core:player/damage/player_to_entity/main_fixed_damage
#
# プレイヤーからモンスターに対してのダメージ処理 定数ダメージ
#
# @within function 
# @input
#        storage mhdp_core:temp Damage.AttackValue 攻撃力 
#        storage mhdp_core:temp Damage.AttackType 攻撃種別
#        storage mhdp_core:temp Damage.DamageMult 物理ダメージ倍率（物理モーション値）
#        storage mhdp_core:temp Damage.PartDamageMult 部位ダメージ倍率
#        storage mhdp_core:temp Damage.IsDecreseSharpness 斬れ味消費有無
# @output
#        score #mhdp_temp_target_part_id MhdpCore 攻撃を受けた部位Id
#        score #mhdp_temp_damage_total MhdpCore 総ダメージ量
#        score #mhdp_temp_damage_phys_type MhdpCore 物理ダメージ種別
#        score #mhdp_temp_damage_phys_value MhdpCore 物理ダメージ量
#        score #mhdp_temp_damage_partdamage_value MhdpCore 部位ダメージ量

# ダメージ計算用値初期値
    # 攻撃力
        execute store result score #mhdp_temp_attack_value MhdpCore run data get storage mhdp_core:temp Damage.AttackValue

# ダメージ量を計算
    # 物理
        # 攻撃力 * モーション値
            execute store result score #mhdp_temp_damage_phys_value MhdpCore run data get storage mhdp_core:temp Damage.DamageMult
            scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore *= #mhdp_temp_attack_value MhdpCore
        # 桁合わせ
            scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore /= #const_100 Const

# プレイヤーのみ、固定ダメージ関連スキル適用
    execute if entity @s[type=player] run function mhdp_core:player/skill/attack/attack_fixed_damage

# 実ダメージ量の計算
    # 部位ダメージ
        # ダメージ * 部位ダメージ倍率
            execute store result score #mhdp_temp_attack_value MhdpCore run data get storage mhdp_core:temp Damage.PartDamageMult
            scoreboard players operation #mhdp_temp_damage_partdamage_value MhdpCore *= #mhdp_temp_attack_value MhdpCore
            scoreboard players operation #mhdp_temp_damage_partdamage_value MhdpCore /= #const_100 Const
    # 総ダメージ
        scoreboard players operation #mhdp_temp_damage_total MhdpCore = #mhdp_temp_damage_phys_value MhdpCore

    tellraw @a [{"text":"固定ダメージ:"},{"score":{"name":"#mhdp_temp_damage_phys_value","objective":"MhdpCore"}}]

# モンスター側の被ダメージ処理に移行
    function mhdp_monsters:core/switch/damage

# 終了
    scoreboard players reset #mhdp_temp_attack_value MhdpCore
    tag @e[tag=Temp.Victim] remove Temp.Victim
    data remove storage mhdp_core:temp Damage
