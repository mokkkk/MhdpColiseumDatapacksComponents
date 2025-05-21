#> mhdp_items:sp_items/nikuyaki/using/end
#
# 肉焼きセットの使用中処理
#
# @within function mhdp_items:sp_items/nikuyaki/tick

# アイテム入手
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches ..79 run data modify storage api: Arg.Path set value "mhdp_items:consume_items/raw_meat"
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 80..169 run data modify storage api: Arg.Path set value "mhdp_items:consume_items/half_cooked_meat"
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 170..179 run data modify storage api: Arg.Path set value "mhdp_items:consume_items/cooked_meat"
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 180.. run data modify storage api: Arg.Path set value "mhdp_items:consume_items/burnt_meat"
    data modify storage api: Arg.Count set value 1
    function api:give_item.m with storage api: Arg

# 通知
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 170..179 at @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] run particle firework ~ ~1 ~ 0 0 0 0.3 10
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 170..179 at @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] run particle flash ~ ~1 ~ 0 0 0 0 1
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 170..179 run tellraw @s {"text":"【上手に焼けました！】","color": "green"}
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 170..179 run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    
# 使用中断
    function mhdp_items:sp_items/nikuyaki/util/interrupt
