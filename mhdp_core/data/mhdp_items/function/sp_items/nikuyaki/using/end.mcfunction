#> mhdp_items:sp_items/nikuyaki/using/end
#
# 肉焼きセットの使用中処理
#
# @within function mhdp_items:sp_items/nikuyaki/tick

# アイテム入手
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches ..49 run give @s paper[item_name='{"text":"生肉","color":"green","italic":false}',custom_name='{"text":"生肉","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"肉焼きセットを使えば","color":"white","italic":false}','{"text":"焼いて食べることができる。","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=2,custom_model_data=57,custom_data={IsMhdpItem:1b,ItemType:1,ItemId:57,ItemName:"RawMeat",UseTimer:99999999}]
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 50..219 run give @s paper[item_name='{"text":"生焼け肉","color":"green","italic":false}',custom_name='{"text":"生焼け肉","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"火が通っていない肉。","color":"white","italic":false}','{"text":"体力を少量回復する。","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=2,custom_model_data=54,food={nutrition:0,saturation:0,can_always_eat:true,eat_seconds:2147483647},custom_data={IsMhdpItem:1b,ItemType:1,ItemId:54,ItemName:"HalfCookedMeat",UseTimer:100}]
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 220..234 run give @s paper[item_name='{"text":"こんがり肉","color":"green","italic":false}',custom_name='{"text":"こんがり肉","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"おいしく焼けた肉。","color":"white","italic":false}','{"text":"体力の最大値が上昇し、","color":"white","italic":false}','{"text":"さらに体力を完全に回復する。","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=2,custom_model_data=56,food={nutrition:0,saturation:0,can_always_eat:true,eat_seconds:2147483647},custom_data={IsMhdpItem:1b,ItemType:1,ItemId:56,ItemName:"CookedMeat",UseTimer:100}]
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 235.. run give @s paper[item_name='{"text":"コゲ肉","color":"green","italic":false}',custom_name='{"text":"コゲ肉","color":"green","italic":false}',lore=['{"text":"--------------------","color":"dark_gray"}','{"text":"黒焦げになってしまった肉。","color":"white","italic":false}','{"text":"食べられなくはない……","color":"white","italic":false}','{"text":"","color":"white","italic":false}','{"text":"--------------------","color":"dark_gray"}'],max_stack_size=2,custom_model_data=55,food={nutrition:0,saturation:0,can_always_eat:true,eat_seconds:2147483647},custom_data={IsMhdpItem:1b,ItemType:1,ItemId:55,ItemName:"BurntMeat",UseTimer:100}]

# 通知
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 220..234 at @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] run particle firework ~ ~1 ~ 0 0 0 0.3 10
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 220..234 at @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] run particle flash ~ ~1 ~ 0 0 0 0 1
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 220..234 run tellraw @s {"text":"【上手に焼けました！】","color": "green"}
    execute if score @n[type=item_display,tag=Itm.Root.Nikuyaki.Target] MhdpCore matches 220..234 run playsound entity.arrow.hit_player master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    
# 使用中断
    function mhdp_items:sp_items/nikuyaki/util/interrupt
