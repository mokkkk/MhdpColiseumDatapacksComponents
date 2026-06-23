#> mhdp_items:sp_items/nikuyaki/util/use
#
# 肉焼きセット使用開始処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# 空中の場合、中断
    execute if entity @s[nbt={OnGround:0b}] run return 0

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


# 使用開始前の位置を保存
    function mhdp_core:player/data/load_data
    data modify storage mhdp_core:temp PlayerData.ItemUsedPos set from entity @s Pos
    function mhdp_core:player/data/save_data

# 肉焼き機オブジェクト召喚
    execute store result storage api: Arg.Override.PlyUid int 1 run scoreboard players get @s Ply.Uid
    execute at @s rotated ~ 0 positioned ^ ^ ^2 run function api:object/summon.m {ObjectId:15}

# 椅子にride
    ride @s mount @n[type=area_effect_cloud,tag=Itm.Nikuyaki.Chair,tag=!Itm.Nikuyaki.Chair.IsRode]

# 音楽再生開始
    function mhdp_core:sound/nikubgm/stop
    function mhdp_core:sound/nikubgm/play

# 終了
    execute on vehicle run tag @s add Itm.Nikuyaki.Chair.IsRode
    tag @n[type=interaction,tag=Other.Interaction.Meat,tag=!Other.Interaction.Meat.IsInit] add Other.Interaction.UI
    tag @n[type=interaction,tag=Other.Interaction.Meat,tag=!Other.Interaction.Meat.IsInit] add Other.Interaction.Meat.IsInit
