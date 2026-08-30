#> mhdp_monster_valk:core/util/models/ignite_end_left
#
# 翼消灯時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 89
    execute if entity @s[tag=Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 95
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 101
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 107

    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 90
    execute if entity @s[tag=Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 96
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 102
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 108

    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 91
    execute if entity @s[tag=Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 97
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 103
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 109
