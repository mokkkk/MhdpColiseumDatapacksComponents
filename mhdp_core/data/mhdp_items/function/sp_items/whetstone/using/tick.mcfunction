#> mhdp_items:sp_items/whetstone/using/tick
#
# 翔蟲の使用中処理
#
# @within function mhdp_items:sp_items/whetstone/tick

# タイマー増加
    scoreboard players add @s Itm.Whetstone.GeneralTimer 1

# 開始
    execute if score @s Itm.Whetstone.GeneralTimer matches 1 run function mhdp_items:sp_items/whetstone/using/start

# 移動停止
    effect give @s slowness 10 10 true
    execute if score @s Itm.Whetstone.GeneralTimer matches 1 run attribute @s generic.jump_strength modifier add mhdp_core:sp_item_jump_strength -0.35 add_value

# 使用中断
    execute if score @s Itm.Whetstone.GeneralTimer matches 1.. unless items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{IsMhdpItem:1b,ItemId:100}] run function mhdp_items:sp_items/whetstone/util/interrupt
    execute if score @s Itm.Whetstone.GeneralTimer matches 1.. if entity @s[tag=Ply.Ope.StartJump] run function mhdp_items:sp_items/whetstone/util/interrupt

# 演出
    execute if score @s Itm.Whetstone.GeneralTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Itm.Whetstone.GeneralTimer matches 21 run function mhdp_items:sp_items/whetstone/using/particle
    execute if score @s Itm.Whetstone.GeneralTimer matches 41 run function mhdp_items:sp_items/whetstone/using/particle
    execute if score @s Itm.Whetstone.GeneralTimer matches 61 run function mhdp_items:sp_items/whetstone/using/particle

# 終了
    execute if entity @s[tag=Skill.Extra.SpeedSharping.1] if score @s Itm.Whetstone.GeneralTimer matches 60.. run function mhdp_items:sp_items/whetstone/using/end
    execute if entity @s[tag=Skill.Extra.SpeedSharping.2] if score @s Itm.Whetstone.GeneralTimer matches 40.. run function mhdp_items:sp_items/whetstone/using/end
    execute if entity @s[tag=!Skill.Extra.SpeedSharping.1,tag=!Skill.Extra.SpeedSharping.2] if score @s Itm.Whetstone.GeneralTimer matches 80.. run function mhdp_items:sp_items/whetstone/using/end
