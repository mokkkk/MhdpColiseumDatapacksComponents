#> api:damage_player_to_entity/calc_actual_damage
#
# 実ダメージ量計算
#
# @input storage api: Arg.

# 実ダメージ量の計算
    # 物理
        # ダメージ * 肉質
            scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore *= #mhdp_temp_defence_phys MhdpCore
            execute store result score #mhdp_temp_damage_total MhdpCore store result score #mhdp_temp_damage_partdamage_value MhdpCore run scoreboard players operation #mhdp_temp_damage_phys_value MhdpCore /= #const_100 Const
    # 部位ダメージ
        # ダメージ * 部位ダメージ倍率
            execute store result score #mhdp_temp_attack_value MhdpCore run data get storage api: Arg.PartDamageMult
            scoreboard players operation #mhdp_temp_damage_partdamage_value MhdpCore *= #mhdp_temp_attack_value MhdpCore
            scoreboard players operation #mhdp_temp_damage_partdamage_value MhdpCore /= #const_100 Const
    # スタン
        execute store result score #mhdp_temp_damage_stun_value MhdpCore run data get storage api: Arg.StunValue
    # 減気
        execute store result score #mhdp_temp_damage_tire_value MhdpCore run data get storage api: Arg.TireValue
    # 龍気
        execute store result score #mhdp_temp_damage_dragonaura_value MhdpCore run data get storage api: Arg.DragonAuraValue
    # 総ダメージ
        scoreboard players operation #mhdp_temp_damage_total MhdpCore += #mhdp_temp_damage_element_value MhdpCore
