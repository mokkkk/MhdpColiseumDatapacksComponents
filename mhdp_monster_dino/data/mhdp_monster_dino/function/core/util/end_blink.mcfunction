#> mhdp_monster_dino:core/util/end_blink
#
# まばたき終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.end_blink

# モデル変更
    execute on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 15
    execute if entity @s[tag=Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 44
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 10
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=!Mns.Break.Head,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 20
    execute if entity @s[tag=Mns.Break.Head,tag=Mns.State.IsAnger,tag=!Mns.Dino.State.HeadHeat] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 45
    execute if entity @s[tag=Mns.Break.Head,tag=Mns.Dino.State.HeadHeat,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 46
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.State.IsAnger,tag=!Mns.Break.Head] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 21
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.State.IsAnger,tag=Mns.Break.Head] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 47
