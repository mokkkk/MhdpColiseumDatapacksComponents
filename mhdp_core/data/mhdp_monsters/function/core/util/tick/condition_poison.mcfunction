#> mhdp_monsters:core/util/tick/condition_poison
# 
# 汎用処理 tickの共通処理
#
# @within function mhdp_monsters:/**

# 効果時間減少
    execute if score @s Mns.Poison.Timer matches 1.. run scoreboard players remove @s Mns.Poison.Timer 1
    execute if score @s Mns.Poison.Timer matches ..0 run tag @s remove Mns.State.IsPoison

# ダメージ
    scoreboard players add @s Mns.Poison.Timer.Sub 1
    execute if score @s Mns.Poison.Timer.Sub matches 20.. run data modify storage mhdp_core:temp Damage set value {AttackValue:100,AttackType:"Poison",DamageMult:100,PartDamageMult:0,IsDecreseSharpness:false}
    execute if score @s Mns.Poison.Timer.Sub matches 20.. store result storage mhdp_core:temp Damage.AttackValue int 1 run scoreboard players get @s Mns.Poison.Effect.Value
    execute if score @s Mns.Poison.Timer.Sub matches 20.. run function mhdp_core:player/damage/player_to_entity/main_fixed_damage
    execute if score @s Mns.Poison.Timer.Sub matches 20.. run scoreboard players set @s Mns.Poison.Timer.Sub 0

# 演出
    execute if score @s Mns.Poison.Timer.Sub matches 5 on passengers if entity @s[tag=aj.data] run function mhdp_monsters:core/util/tick/macro/m.poison_effect with entity @s data.locators.pos_head
    execute if score @s Mns.Poison.Timer.Sub matches 15 on passengers if entity @s[tag=aj.data] run function mhdp_monsters:core/util/tick/macro/m.poison_effect with entity @s data.locators.pos_head
