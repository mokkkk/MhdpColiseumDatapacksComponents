#> mhdp_monsters:core/util/damage/remove_tags
# 
# 汎用処理 被ダメージタグ削除
#
# @within function mhdp_monsters:/**

# tag
    tag @s remove Mns.Temp.IsDamaged
    tag @s remove Mns.Temp.Damage.Anger
    tag @s remove Mns.Temp.Damage.Poison
    tag @s remove Mns.Temp.Damage.Paralysis
    tag @s remove Mns.Temp.Damage.Bomb
    tag @s remove Mns.Temp.Damage.Stun
    tag @s remove Mns.Temp.Damage.Tire
    tag @s remove Mns.Temp.Damage.DragonAura

# score
    scoreboard players reset #mhdp_temp_target_part_id MhdpCore
    scoreboard players reset #mhdp_temp_damage_total MhdpCore
    scoreboard players reset #mhdp_temp_damage_phys_type MhdpCore
    scoreboard players reset #mhdp_temp_damage_phys_value MhdpCore
    scoreboard players reset #mhdp_temp_damage_element_value MhdpCore
    scoreboard players reset #mhdp_temp_damage_partdamage_value MhdpCore
    scoreboard players reset #mhdp_temp_condition_value_poison MhdpCore
    scoreboard players reset #mhdp_temp_condition_value_paralysis MhdpCore
    scoreboard players reset #mhdp_temp_condition_value_bomb MhdpCore
    scoreboard players reset #mhdp_temp_damage_stun_value MhdpCore
    scoreboard players reset #mhdp_temp_damage_tire_value MhdpCore
    scoreboard players reset #mhdp_temp_damage_dragonaura_value MhdpCore
