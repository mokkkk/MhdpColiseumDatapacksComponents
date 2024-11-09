#> mhdp_items:sp_items/nikuyaki/using/tick
#
# 肉焼きセットの使用中処理
#
# @within function mhdp_items:sp_items/nikuyaki/tick

# タイマー増加
    scoreboard players add @s Itm.Nikuyaki.GeneralTimer 1

# 紐づけ
    function mhdp_items:sp_items/nikuyaki/using/get_target_model

# rideしていない場合、使用中断
    execute on vehicle if entity @s[type=armor_stand,tag=Itm.Nikuyaki.Chair,tag=Itm.Nikuyaki.Chair.IsRode] on passengers run tag @s add Itm.Sp.Nikuyaki.Using.Ride
    execute unless entity @s[tag=Itm.Sp.Nikuyaki.Using.Ride] run function mhdp_items:sp_items/nikuyaki/using/end
    tag @s remove Itm.Sp.Nikuyaki.Using.Ride

# 終了
    execute if score @s Itm.Nikuyaki.GeneralTimer matches 300.. run function mhdp_items:sp_items/nikuyaki/using/end
    tag @n[type=item_display,tag=Itm.Root.Nikuyaki,tag=Itm.Root.Nikuyaki.Target] remove Itm.Root.Nikuyaki.Target
