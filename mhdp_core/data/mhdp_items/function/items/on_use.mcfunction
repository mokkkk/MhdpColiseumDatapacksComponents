#> mhdp_items:items/on_use
#
# アイテム使用時の共通処理
#
# @within function mhdp_items:/**

# 効果音
    playsound entity.player.levelup master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 2

# 各アイテムのfunctionに移行 
    data modify storage mhdp_core:temp Temp.ItemName set from entity @s SelectedItem.components."minecraft:custom_data".ItemName
    function mhdp_items:items/macro/m.get_use_function with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp

# クエスト中のみ、アイテムの個数減少
    execute if entity @s[tag=Ply.State.PlayingQuest] run item modify entity @s weapon.mainhand {function:set_count,count:-1,add:true}

# 終了
    scoreboard players set @s Ply.Ope.EatingTimer -40
    scoreboard players set @s Wpn.DeactivateTimer 5
