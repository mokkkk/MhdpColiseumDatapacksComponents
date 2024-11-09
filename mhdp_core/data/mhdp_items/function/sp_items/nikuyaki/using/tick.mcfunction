#> mhdp_items:sp_items/nikuyaki/using/tick
#
# 肉焼きセットの使用中処理
#
# @within function mhdp_items:sp_items/nikuyaki/tick

# タイマー増加
    scoreboard players add @s Itm.Nikuyaki.GeneralTimer 1

# 開始
    execute if score @s Itm.Nikuyaki.GeneralTimer matches 1 run function mhdp_items:sp_items/nikuyaki/using/start

# 紐づけ
    function mhdp_items:sp_items/nikuyaki/using/get_target_model

# rideしていない場合、使用中断
    execute on vehicle if entity @s[type=armor_stand,tag=Itm.Nikuyaki.Chair,tag=Itm.Nikuyaki.Chair.IsRode] on passengers run tag @s add Itm.Sp.Nikuyaki.Using.Ride
    execute unless entity @s[tag=Itm.Sp.Nikuyaki.Using.Ride] run function mhdp_items:sp_items/nikuyaki/using/end
    tag @s remove Itm.Sp.Nikuyaki.Using.Ride

# # 移動停止
#     effect give @s slowness 10 10 true
#     execute if score @s Itm.Nikuyaki.GeneralTimer matches 1 run attribute @s generic.jump_strength modifier add mhdp_core:sp_item_jump_strength -0.35 add_value

# # 使用中断
#     execute if score @s Itm.Nikuyaki.GeneralTimer matches 1.. unless items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{IsMhdpItem:1b,ItemId:100}] run function mhdp_items:sp_items/nikuyaki/util/interrupt
#     execute if score @s Itm.Nikuyaki.GeneralTimer matches 1.. if entity @s[tag=Ply.Ope.StartJump] run function mhdp_items:sp_items/nikuyaki/util/interrupt

# # 演出
#     execute if score @s Itm.Nikuyaki.GeneralTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
#     execute if score @s Itm.Nikuyaki.GeneralTimer matches 21 run function mhdp_items:sp_items/nikuyaki/using/particle
#     execute if score @s Itm.Nikuyaki.GeneralTimer matches 41 run function mhdp_items:sp_items/nikuyaki/using/particle
#     execute if score @s Itm.Nikuyaki.GeneralTimer matches 61 run function mhdp_items:sp_items/nikuyaki/using/particle

# 終了
    execute if score @s Itm.Nikuyaki.GeneralTimer matches 300.. run function mhdp_items:sp_items/nikuyaki/using/end
    tag @n[type=item_display,tag=Itm.Root.Nikuyaki,tag=Itm.Root.Nikuyaki.Target] remove Itm.Root.Nikuyaki.Target
