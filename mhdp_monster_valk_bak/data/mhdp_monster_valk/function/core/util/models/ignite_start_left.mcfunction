#> mhdp_monster_valk:core/util/models/ignite_start_left
#
# 翼点火時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 125
    execute if entity @s[tag=Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 131
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 137
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 143

    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 126
    execute if entity @s[tag=Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 132
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 138
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_1] run data modify entity @s item.components."minecraft:custom_model_data" set value 144

    execute on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 127
    execute if entity @s[tag=Mns.Break.Wing.L,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 133
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 139
    execute if entity @s[tag=Mns.State.IsAnger,tag=Mns.Break.Wing.L] on passengers if entity @s[tag=aj.valk_aj.bone.finger_left_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 145
