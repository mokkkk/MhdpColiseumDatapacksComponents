#> mhdp_monster_dino:core/util/models/anger_start
#
# 怒り開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 状態更新(一時)
    tag @s add Mns.State.IsAnger

# モデル変更
    execute on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 10
    execute if entity @s[tag=Mns.Break.Head,tag=!Mns.Dino.State.HeadHeat] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 45
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=!Mns.Break.Head] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 21
    execute if entity @s[tag=Mns.Dino.State.HeadHeat,tag=Mns.Break.Head] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 47
    
    execute on passengers if entity @s[tag=aj.dino_aj.bone.body_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.body_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 11

    execute on passengers if entity @s[tag=aj.dino_aj.bone.body_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.body_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 12

    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 13

    execute on passengers if entity @s[tag=aj.dino_aj.bone.tail_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] on passengers if entity @s[tag=aj.dino_aj.bone.tail_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 14
    execute if entity @s[tag=Mns.Dino.State.TailHeat] on passengers if entity @s[tag=aj.dino_aj.bone.tail_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 38
    execute if entity @s[tag=Mns.Dino.State.TailRust] on passengers if entity @s[tag=aj.dino_aj.bone.tail_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 43
