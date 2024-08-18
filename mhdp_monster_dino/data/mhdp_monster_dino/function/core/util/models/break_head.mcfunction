#> mhdp_monster_dino:core/util/models/break_head
#
# 頭部位破壊時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    execute on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.State.IsAnger,tag=!Mns.Dino.State.HeadHeat] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 44
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Dino.State.HeadHeat] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 45
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 46
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Dino.State.HeadHeat] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 47
