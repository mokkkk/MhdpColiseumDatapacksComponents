#> mhdp_monster_dino:core/util/models/anger_start
#
# 喉赤熱化開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# 状態更新(一時)
    tag @s add Mns.Dino.State.HeadHeat

# モデル変更
    execute on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 20
    execute if entity @s[tag=Mns.Break.Head,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 46
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Head] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 21
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Head] on passengers if entity @s[tag=aj.dino_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 47

    execute on passengers if entity @s[tag=aj.dino_aj.bone.head_lower] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.head_lower] run data modify entity @s item.components."minecraft:custom_model_data" set value 25

    execute on passengers if entity @s[tag=aj.dino_aj.bone.neck_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.neck_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 22

    execute on passengers if entity @s[tag=aj.dino_aj.bone.neck_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.neck_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 23

    execute on passengers if entity @s[tag=aj.dino_aj.bone.neck_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.dino_aj.bone.neck_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 24