#> mhdp_items:sp_items/nikuyaki/util/use
#
# 肉焼きセット使用開始処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# 使用中の場合、中断
    execute if entity @s[tag=Itm.Sp.Nikuyaki.Using] run return 0

# 生肉を1個以上持っていない場合、中断
    execute store result score #mhdp_temp_meat_count MhdpCore run clear @s paper[custom_data~{ItemId:57}] 1
    execute unless score #mhdp_temp_meat_count MhdpCore matches 1.. run tellraw @s {"text":"【生肉を所持していないため、使用できません】","color": "red"}
    execute unless score #mhdp_temp_meat_count MhdpCore matches 1.. run return run scoreboard players reset #mhdp_temp_meat_count MhdpCore
    scoreboard players reset #mhdp_temp_meat_count MhdpCore

# 使用開始
    scoreboard players set @s Itm.Nikuyaki.GeneralTimer 0
    tag @s add Itm.Sp.Nikuyaki.Using

# モデル召喚
    execute at @s rotated ~ 0 positioned ^ ^ ^2 run function animated_java:nikuyaki/summon {args: {animation: 'baking', start_animation: true}}

# 紐づけ
    scoreboard players operation @n[type=item_display,tag=Itm.Root,tag=Itm.Root.Nikuyaki,tag=Itm.Root.Nikuyaki.Start] Ply.Uid = @s Ply.Uid
    scoreboard players operation @n[type=interaction,tag=Other.Interaction.Meat,tag=!Other.Interaction.Meat.IsInit] Ply.Uid = @s Ply.Uid
    scoreboard players set @n[type=item_display,tag=Itm.Root,tag=Itm.Root.Nikuyaki,tag=Itm.Root.Nikuyaki.Start] Mns.General.DummyCounter 10

# ride
    ride @s mount @n[type=armor_stand,tag=Itm.Nikuyaki.Chair,tag=!Itm.Nikuyaki.Chair.IsRode]

# 終了
    tag @n[type=armor_stand,tag=Itm.Nikuyaki.Chair,tag=!Itm.Nikuyaki.Chair.IsRode] add Itm.Nikuyaki.Chair.IsRode
    tag @n[type=interaction,tag=Other.Interaction.Meat,tag=!Other.Interaction.Meat.IsInit] add Other.Interaction.UI
    tag @n[type=interaction,tag=Other.Interaction.Meat,tag=!Other.Interaction.Meat.IsInit] add Other.Interaction.Meat.IsInit
    tag @n[type=item_display,tag=Itm.Root,tag=Itm.Root.Nikuyaki,tag=Itm.Root.Nikuyaki.Start] remove Itm.Root.Nikuyaki.Start
