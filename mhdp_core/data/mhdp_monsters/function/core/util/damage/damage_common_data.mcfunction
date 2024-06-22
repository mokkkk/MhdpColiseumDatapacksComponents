#> mhdp_monsters:core/util/damage/damage_common_data
# 
# 汎用処理 被ダメージ
#
# @within function mhdp_monsters:/**
#
# @input
#        score #mhdp_temp_target_part_id MhdpCore 攻撃を受けた部位Id
#        score #mhdp_temp_damage_total MhdpCore 総ダメージ量
#        score #mhdp_temp_damage_phys_type MhdpCore 物理ダメージ種別
#        score #mhdp_temp_damage_phys_value MhdpCore 物理ダメージ量
#        score #mhdp_temp_damage_element_value MhdpCore 属性ダメージ量
#        score #mhdp_temp_damage_partdamage_value MhdpCore 部位ダメージ量
#        score #mhdp_temp_condition_value_poison MhdpCore 毒ダメージ量
#        score #mhdp_temp_condition_value_paralysis MhdpCore 麻痺ダメージ量
#        score #mhdp_temp_condition_value_bomb MhdpCore 爆破ダメージ量
#        score #mhdp_temp_damage_stun_value MhdpCore スタン量
#        score #mhdp_temp_damage_tire_value MhdpCore 減気量
#        score #mhdp_temp_damage_dragonaura_value MhdpCore 龍気量

# HP

# 状態異常
    execute if entity @s[tag=Mns.Param.IsPoisonEnable] run scoreboard players operation @s Mns.Poison.Damage -= #mhdp_temp_condition_value_poison MhdpCore
    execute if entity @s[tag=Mns.Param.IsParalysisEnable] run scoreboard players operation @s Mns.Paralysis.Damage -= #mhdp_temp_condition_value_paralysis MhdpCore
    execute if entity @s[tag=Mns.Param.IsBombEnable] run scoreboard players operation @s Mns.Bomb.Damage -= #mhdp_temp_condition_value_bomb MhdpCore

# スタン
    execute if entity @s[tag=!Mns.State.IsStun] run scoreboard players operation @s Mns.Stun.Damage -= #mhdp_temp_damage_stun_value MhdpCore

# 減気

# 龍気