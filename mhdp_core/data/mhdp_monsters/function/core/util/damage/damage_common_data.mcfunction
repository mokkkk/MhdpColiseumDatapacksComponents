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
    scoreboard players operation @s Mns.Hp -= #mhdp_temp_damage_total MhdpCore
    scoreboard players operation @s Mns.Hp.Half -= #mhdp_temp_damage_total MhdpCore
    # クエストのHP半減時処理を呼び出す
        execute if entity @s[tag=!Mns.HpHalf] if score @s Mns.Hp.Half matches ..0 run function mhdp_monsters:core/util/damage/check_hp_half

# 怒り
    execute if entity @s[tag=!Mns.State.IsAnger] run scoreboard players operation @s Mns.Anger.Damage -= #mhdp_temp_damage_anger_value MhdpCore
    execute if score @s Mns.Anger.Damage matches ..0 run tag @s add Mns.Temp.Damage.Anger

# 状態異常
    execute if entity @s[tag=Mns.Param.IsPoisonEnable] run scoreboard players operation @s Mns.Poison.Damage -= #mhdp_temp_condition_value_poison MhdpCore
    execute if entity @s[tag=Mns.Param.IsParalysisEnable,tag=!Mns.State.IsParalysis] run scoreboard players operation @s Mns.Paralysis.Damage -= #mhdp_temp_condition_value_paralysis MhdpCore
    execute if entity @s[tag=Mns.Param.IsBombEnable] run scoreboard players operation @s Mns.Bomb.Damage -= #mhdp_temp_condition_value_bomb MhdpCore
    execute if entity @s[tag=!Mns.State.IsPoison] if score @s Mns.Poison.Damage matches ..0 run tag @s add Mns.Temp.Damage.Poison
    execute if entity @s[tag=!Mns.State.IsParalysis] if score @s Mns.Paralysis.Damage matches ..0 run tag @s add Mns.Temp.Damage.Paralysis
    execute if score @s Mns.Bomb.Damage matches ..0 run tag @s add Mns.Temp.Damage.Bomb

# スタン
    execute if entity @e[type=slime,tag=Temp.Victim,tag=Mns.HitBox.Head] if entity @s[tag=!Mns.State.IsStun] run scoreboard players operation @s Mns.Stun.Damage -= #mhdp_temp_damage_stun_value MhdpCore
    execute if score @s Mns.Stun.Damage matches ..0 run tag @s add Mns.Temp.Damage.Stun

# 減気
    execute if entity @s[tag=!Mns.State.IsDown,tag=!Mns.State.IsStun,tag=!Mns.State.IsParalysis] run scoreboard players operation @s Mns.Tire.Damage -= #mhdp_temp_damage_tire_value MhdpCore
    execute if score @s Mns.Tire.Damage matches ..0 run tag @s add Mns.Temp.Damage.Tire

# 龍気
    scoreboard players operation @s Mns.DragonAura.Damage -= #mhdp_temp_damage_dragonaura_value MhdpCore
    execute if score @s Mns.DragonAura.Damage matches ..0 run tag @s add Mns.Temp.Damage.DragonAura